{{ config(materialized='table', schema='aadsc_data') }}

{% set relation = ref('aadsc_stg_clinical') %}
{% set constant_columns = ['MASKED_ID','AGE','SEX','RACE','ETHNICITY','EXTRACTION_DATE','BMI','HEIGHT','WEIGHT'] %}
{% set condition_columns = get_unpivot_columns(relation=relation, exclude=constant_columns) %}

    with 
    unpivot_df as (
    -- Convert from 'wide' to 'long' src data format.
    -- Uses union all strategy as it is available across dbs.
    -- Output schema: 'masked_id','age','sex','race','ethnicity','extraction_date','bmi','height','weight','condition','assertion'
    
    {% for col in condition_columns %}
        select
            {{ constant_columns | join(', ') }},
            '{{ col }}' as condition,
            cast({{ col }} as varchar) as assertion
        from {{ ref('aadsc_stg_clinical') }}
        {% if not loop.last %}union all{% endif %}
    {% endfor %}
    )
    ,annotations as (
    select
        "Source Column [PL]" ::text as src_column,
        "MONDO Code" ::text as mondo_code,
        "MONDO Label" ::text as mondo_label,
        "HPO Code" ::text as hpo_code,
        "HPO Label" ::text as hpo_label,
        "ICD-9 Codes" ::text as icd_9_codes,
        "ICD-10 Codes" ::text as icd_10_codes,
        "ICD-O Codes" ::text as icd_o_codes
        from {{ ref('annotations') }} as a
    )
    ,source as (
        select 
            'aadsc'::text as "study_code",
            c.masked_id::text as "participant_global_id",
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
                WHEN c.assertion IS 1
                    THEN 'Observed'
                ELSE 'Not Observed'
            ::text END as "condition_interpretation",
            NULL as "condition_status",
            NULL as "condition_data_source",
            a.hpo_label,
            a.hpo_code,
            a.mondo_label,
            a.mondo_code,
            NULL as "maxo_label",
            NULL as "maxo_code",
            NULL as "other_label",
                NULLIF(
                CONCAT_WS('|', a.icd_9_codes, a.icd_10_codes, a.icd_o_codes),'')
            ::text as "other_code",
            NULL as "measure_value",
            NULL as "measure_unit"
        from unpivot_df as c
        left join annotations as a
        on a.src_column = c.condition -- Match based on source column name
    )


select * 
from source