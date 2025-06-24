{{ config(materialized='table', schema='aadsc_data') }}

{% set relation = ref('aadsc_stg_clinical') %}
{% set constant_columns = ['ftd_index','MASKED_ID','AGE','SEX','RACE','ETHNICITY','EXTRACTION_DATE','BMI','HEIGHT','WEIGHT'] %}
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
        NULLIF(
        CONCAT_WS('|', "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix"),'')
        ::text as other_codes
    from {{ ref('annotations') }} as a
    where "icd9_codes_with_prefix" is not null 
        or "icd10_codes_with_prefix" is not null 
        or "icdO_codes_with_prefix" is not null
    )
    ,source as (
        select 
            c.ftd_index,
            'aadsc'::text as "study_code",
            NULL as "participant_global_id",
            c.masked_id::text as "participant_external_id",
            NULL as "event_id",
            NULL as "event_type",
            c.condition::text as "condition_or_measure_source_text",
                CASE 
                WHEN c.age == 'Age 90 or older'
                    THEN NULL
                ELSE
                    floor(cast(c.age as float))
            ::integer END as "age_at_first_patient_engagement",
                CASE
                WHEN c.assertion = 1
                    THEN 'Observed'
                ELSE 'Not Observed' -- Should not occur. See unpivot_df cte
            ::text END as "condition_interpretation",
            NULL as "condition_status",
            'clinical'::text as "condition_data_source",
            ha.hpo_label,
            ha.hpo_code,
            ma.mondo_label,
            ma.mondo_code,
            NULL as "maxo_label",
            NULL as "maxo_code",
            NULL as "other_label",
            oa.other_codes::text as "other_code",
            NULL as "measure_value",
            NULL as "measure_unit"
        from unpivot_df as c
        left join mondo_annotations as ma
            on ma.condition_name = c.condition
        left join hpo_annotations as ha
            on ha.condition_name = c.condition
        left join other_annotations as oa
            on oa.condition_name = c.condition
    )


select * 
from source