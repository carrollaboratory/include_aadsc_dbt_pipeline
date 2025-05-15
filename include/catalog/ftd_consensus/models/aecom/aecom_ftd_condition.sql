{{ config(materialized='table', schema='aecom_data') }}

SELECT 
    c.study_code::TEXT AS "study_code",
    'REQUIRED'::TEXT AS "participant_global_id", -- Need to join to something here
    c.participant_id::TEXT AS "participant_external_id",
    NULL::TEXT AS "event_id",
    NULL::TEXT AS "event_type", -- Could be 'Visit'?
    c.remarks::TEXT AS "condition_or_measure_source_text",
    NULL::INTEGER AS "age_at_condition_or_measure_observation",
    NULL::TEXT AS "condition_interpretation", --Inferred 'Observation'
    NULL::TEXT AS "condition_status", -- Inferred 'History of'
    NULL::TEXT AS "condition_data_source", --Inferred 
    NULL::TEXT AS "hpo_label",
    NULL::TEXT AS "hpo_code",
    NULL::TEXT AS "mondo_label",
    NULL::TEXT AS "mondo_code",
    NULL::TEXT AS "maxo_label", --Could be inferred?
    NULL::TEXT AS "maxo_code",--Could be inferred?
    NULL::TEXT AS "other_label",--Could be inferred?
    NULL::TEXT AS "other_code",--Could be inferred?
    NULL::INTEGER AS "measure_value",
    NULL::TEXT AS "measure_unit"
FROM {{ ref('aecom_stg_combined') }} AS c
