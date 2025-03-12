{{ config(materialized='table') }}

WITH source AS (
    SELECT 
       "Study Code"::TEXT AS "study_code",
       "Participant Global ID"::TEXT AS "participant_global_id",
       "Participant External ID"::TEXT AS "participant_external_id",
       "Event ID"::INTEGER AS "event_id",
       "Event Type"::TEXT AS "event_type",
       "Condition or Measure Source Text"::TEXT AS "condition_or_measure_source_text",
       "Age at Condition or Measure Observation"::INTEGER AS "age_at_condition_or_measure_observation",
       "Condition Interpretation"::TEXT AS "condition_interpretation",
       "Condition Status"::TEXT AS "condition_status",
       "Condition Data Source"::TEXT AS "condition_data_source",
       "HPO Label"::TEXT AS "hpo_label",
       "HPO Code"::TEXT AS "hpo_code",
       "MONDO Label"::TEXT AS "mondo_label",
       "MONDO Code"::TEXT AS "mondo_code",
       "MAXO Label"::TEXT AS "maxo_label",
       "MAXO Code"::TEXT AS "maxo_code",
       "Other Label"::TEXT AS "other_label",
       "Other Code"::TEXT AS "other_code",
       "Measure Value"::TEXT AS "measure_value",
       "Measure Unit"::TEXT AS "measure_unit"
    FROM {{ ref('mewmew_raw_condition') }}
)

SELECT 
    *,
    CONCAT(study_code, '-', participant_global_id) AS ftd_key
FROM source
