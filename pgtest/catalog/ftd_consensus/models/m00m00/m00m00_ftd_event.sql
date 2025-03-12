{{ config(materialized='table', schema='m00m00_data') }}

WITH source AS (
    SELECT 
       participant.ftd_key::TEXT AS "ftd_key",
       participant.study_code::TEXT AS "study_code",
       participant.participant_global_id::TEXT AS "participant_global_id",
       participant.participant_external_id::TEXT AS "participant_external_id",
       participant.age_at_first_patient_engagement::INTEGER AS "age_at_first_patient_engagement",
       participant.first_patient_engagement_event::TEXT AS "first_patient_engagement_event"
    FROM {{ ref('m00m00_stg_participant') }} AS participant
    JOIN {{ ref('m00m00_stg_condition') }} AS condition USING (ftd_key)
)

SELECT 
    * 
FROM source
