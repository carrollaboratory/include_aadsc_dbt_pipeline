{{ config(materialized='table', schema='aadsc_data') }}

{% set relation = ref('aadsc_stg_clinical') %}
{% set constant_columns = ['ftd_index','MASKED_ID','AGE','SEX','RACE','ETHNICITY','EXTRACTION_DATE'] %}
{% set condition_columns = get_columns(relation=relation, exclude=constant_columns) %}

    with 
    condition_display_lookup as (
        select 
          variable_name as condition,
          description as display
        from {{ ref('clinical_stg_dd') }}
    )
    ,unpivot_df as (
    -- Convert from 'wide' to 'long' src data format.
    -- Uses union all strategy as it is available across dbs.
    -- Output schema: 'ftd_index','masked_id','age','sex','race','ethnicity','extraction_date','bmi','height','weight','condition','assertion'(1,bmi,height,or weight)
    
    {% for col in condition_columns %}
        select
            {{ constant_columns | join(', ') }},
            '{{ col }}' as condition,
            cast({{ col }} as varchar) as assertion
        from {{ ref('aadsc_stg_clinical') }}
        where {{ col }} IS NOT NULL
        {% if not loop.last %}union all{% endif %}
    {% endfor %}
    )
    ,mondo_annotations as (
    select
        distinct
        "condition_name" ::text as condition_name,
        "mondo_codes_with_prefix" ::text as mondo_code,
        "mondo_label" ::text as mondo_label
        from {{ ref('annotations') }} as a
        where "mondo_codes_with_prefix" is not null
            or "mondo_label" is not null
    )
    ,hpo_annotations as (
    select
        distinct
        "condition_name" ::text as condition_name,
        "hpo_codes_with_prefix" ::text as hpo_code,
        "hpo_label" ::text as hpo_label
    from {{ ref('annotations') }} as a
    where "hpo_codes_with_prefix" is not null
        or "hpo_label" is not null
    )
    ,other_annotations as (
    select
        distinct
        "condition_name" ::text as condition_name,
        "icd9_codes_with_prefix",
        "icd10_codes_with_prefix",
        "icdO_codes_with_prefix",
        "icd10cm_label",
        "loinc_label",
        "loinc_code"
    from {{ ref('annotations') }} as a
    where "icd9_codes_with_prefix" is not null 
        or "icd10_codes_with_prefix" is not null 
        or "icdO_codes_with_prefix" is not null
        or "loinc_code" is not null
    )

    ,source as (
        select 
            clinical.ftd_index,
            'AADSC' as "study_code",
            clinical.condition::text as "condition_or_measure_source_text_code", -- Ex: gi_ibs_status
            cdl.display::text as "condition_or_measure_source_text_display", -- Ex: Irritable bowel syndrome
                case 
                when cdl.display = 'HP_0032551' then clinical.condition
                else coalesce(cdl.display,clinical.condition,NULL) 
            end as "condition_or_measure_source_text",
            clinical.masked_id::text as "participant_external_id",
                case
                when clinical.assertion = '1'
                    then 'Observed'
                when  clinical.assertion = '0'
                    then 'Not Observed'
                when  clinical.assertion is null
                    then null
                else null -- NULL for bmi, height, weight
            end as "condition_interpretation",
            ha.hpo_label,
            ha.hpo_code,
            ma.mondo_label,
            ma.mondo_code,
                case 
                when ha.hpo_code is null and ma.mondo_code is null
                    then (select COALESCE("icd10cm_label","loinc_label",'') 
                          from other_annotations 
                          where condition_name = clinical.condition
                          order by "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix", "loinc_code"
                          limit 1)::text
                else null 
            end as "other_label",
                case 
                when ha.hpo_code is null and ma.mondo_code is null
                    then (select COALESCE("icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix","loinc_code",'') 
                          from other_annotations 
                          where condition_name = clinical.condition
                          order by "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix", "loinc_code"
                          limit 1)::text
                else null 
            end as "other_code",
                case
                when clinical.condition in ('bmi','height','weight')
                    then clinical.assertion
                else null
            end as "measure_value",
                case
                when  clinical.condition = 'bmi'
                    then 'kg/m2' 
                when  clinical.condition = 'height'
                    then 'in'
                when  clinical.condition = 'weight'
                    then 'lb'
                else null
            end as "measure_unit",
        from unpivot_df as clinical
        left join mondo_annotations as ma
            on ma.condition_name = clinical.condition
        left join hpo_annotations as ha
            on ha.condition_name = clinical.condition
        left join condition_display_lookup as cdl
            on cdl.condition = clinical.condition
    )


select 
    source.ftd_index,
    source.study_code, --req
    null::text as "participant_global_id", --req, created after the pipeline
    source.participant_external_id, --req
    null::text as "event_id",
    null::text as "event_type",
    null::integer as "age_at_condition_measure_observation",
    source.condition_or_measure_source_text_display,
    source.condition_or_measure_source_text_code,
    source.condition_or_measure_source_text,
    null::integer as "age_at_first_patient_engagement",
    source.condition_interpretation,
    null::text as "condition_status",
    null::text as "condition_data_source",
    source.hpo_label,
    source.hpo_code,
    source.mondo_label,
    source.mondo_code,
    null::text as "maxo_label",
    null::text as "maxo_code",
    source.other_label,
    source.other_code,
    source.measure_value as "measure_value",
    source.measure_unit as "measure_unit"
from source