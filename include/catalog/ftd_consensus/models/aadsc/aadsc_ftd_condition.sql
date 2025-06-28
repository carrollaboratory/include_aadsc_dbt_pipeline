{{ config(materialized='table', schema='aadsc_data') }}

{% set relation = ref('aadsc_stg_clinical') %}
{% set constant_columns = ['ftd_index','MASKED_ID','AGE','SEX','RACE','ETHNICITY','EXTRACTION_DATE','HEIGHT','WEIGHT'] %}
{% set condition_columns = get_unpivot_columns(relation=relation, exclude=constant_columns) %}

    with 
    unpivot_df as (
    -- Convert from 'wide' to 'long' src data format.
    -- Uses union all strategy as it is available across dbs.
    -- Output schema: 'ftd_index','masked_id','age','sex','race','ethnicity','extraction_date','bmi','height','weight','condition','assertion'
    
    {% for col in condition_columns %}
        select
            {{ constant_columns | join(', ') }},
            '{{ col }}' as condition,
            cast({{ col }} as varchar) as assertion
        from {{ ref('aadsc_stg_clinical') }}
        where {{ col }} = 1
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
        "icd10cm_label"
    from {{ ref('annotations') }} as a
    where "icd9_codes_with_prefix" is not null 
        or "icd10_codes_with_prefix" is not null 
        or "icdO_codes_with_prefix" is not null
    )
    ,source as (
        select 
            clinical.ftd_index,
            'aadsc' as "study_code",
                {{ generate_global_id(prefix='c',descriptor=['clinical.MASKED_ID'], study_id='aadsc') }}
            ::text as "participant_external_id",
            clinical.condition::text as "condition_or_measure_source_text",
                case
                when  clinical.age = 'Age 90 or older'
                    then 0
                when  clinical.age is null
                    then 0
                else FLOOR(CAST(clinical.age AS FLOAT) * 365.25)
            end as "age_at_first_patient_engagement",
                case
                when  clinical.assertion = '1'
                    then 'Observed'
                when  clinical.assertion = '0'
                    then 'Not Observed'
                when  clinical.assertion is null
                    then null
                else null
            end as "condition_interpretation",
            ha.hpo_label,
            ha.hpo_code,
            ma.mondo_label,
            ma.mondo_code,
                case 
                when ha.hpo_code is null and ma.mondo_code is null
                    then (select "icd10cm_label" 
                          from other_annotations 
                          where condition_name = clinical.condition
                          order by "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix"
                          limit 1)::text
                else null 
            end as "other_label",
                case 
                when ha.hpo_code is null and ma.mondo_code is null
                    then (select COALESCE("icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix",'') 
                          from other_annotations 
                          where condition_name = clinical.condition
                          order by "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix"
                          limit 1)::text
                else null 
            end as "other_code",
        from unpivot_df as clinical
        left join mondo_annotations as ma
            on ma.condition_name = clinical.condition
        left join hpo_annotations as ha
            on ha.condition_name = clinical.condition
    )


select 
    source.ftd_index,
    source.study_code, --req
    null::text as "participant_global_id", --req, created after the pipeline
    source.participant_external_id, --req
    null::text as "event_id",
    null::text as "event_type",
    null::integer as "age_at_condition_measure_observation",
    source.condition_or_measure_source_text,
    source.age_at_first_patient_engagement,
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
    null::text as "measure_value",
    null::text as "measure_unit"
from source