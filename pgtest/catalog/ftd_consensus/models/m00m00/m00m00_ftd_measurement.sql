{{ config(materialized='table', schema='m00m00_data') }}

WITH source AS (
    SELECT 
       participant.ftd_key::TEXT AS "ftd_key",
       participant.study_code::TEXT AS "study_code",
       participant.participant_global_id::TEXT AS "participant_global_id",
       participant.participant_external_id::TEXT AS "participant_external_id",
       condition.condition_or_measure_source_text::TEXT AS "condition_or_measure_source_text",
       condition.age_at_condition_or_measure_observation::INTEGER AS "age_at_condition_or_measure_observation",
       condition.condition_interpretation::TEXT AS "condition_interpretation",
       condition.condition_status::TEXT AS "condition_status",
       condition.condition_data_source::TEXT AS "condition_data_source",
       condition.other_label::TEXT AS "other_label",
       condition.other_code::TEXT AS "other_code",
       condition.measure_value::TEXT AS "measure_value",
       condition.measure_unit::TEXT AS "measure_unit"
    FROM {{ ref('m00m00_stg_participant') }} AS participant
    JOIN {{ ref('m00m00_stg_condition') }} AS condition USING (ftd_key)
)

SELECT 
    * 
FROM source
