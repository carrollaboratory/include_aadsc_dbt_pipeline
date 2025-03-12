{{ config(materialized='table', schema='mewmew_data') }}

WITH source AS (
    SELECT 
       participant.ftd_key::TEXT AS "ftd_key",
       participant.down_syndrome_status::TEXT AS "down_syndrome_status",
       participant.age_at_first_patient_engagement::INTEGER AS "age_at_first_patient_engagement",
       participant.first_patient_engagement_event::TEXT AS "first_patient_engagement_event",
       participant.outcomes_vital_status::TEXT AS "outcomes_vital_status",
       participant.age_at_last_vital_status::INTEGER AS "age_at_last_vital_status",
       participant.study_code::TEXT AS "study_code",
       participant.participant_global_id::TEXT AS "participant_global_id",
       participant.participant_external_id::TEXT AS "participant_external_id",
       condition.event_id::INTEGER AS "event_id",
       condition.event_type::TEXT AS "event_type",
       condition.condition_or_measure_source_text::TEXT AS "condition_or_measure_source_text",
       condition.age_at_condition_or_measure_observation::INTEGER AS "age_at_condition_or_measure_observation",
       condition.condition_interpretation::TEXT AS "condition_interpretation",
       condition.condition_status::TEXT AS "condition_status",
       condition.condition_data_source::TEXT AS "condition_data_source",
       condition.hpo_label::TEXT AS "hpo_label",
       condition.hpo_code::TEXT AS "hpo_code",
       condition.mondo_label::TEXT AS "mondo_label",
       condition.mondo_code::TEXT AS "mondo_code",
       condition.maxo_label::TEXT AS "maxo_label",
       condition.maxo_code::TEXT AS "maxo_code",
       condition.other_label::TEXT AS "other_label",
       condition.other_code::TEXT AS "other_code",
       condition.measure_value::TEXT AS "measure_value",
       condition.measure_unit::TEXT AS "measure_unit"
    FROM {{ ref('mewmew_stg_participant') }} AS participant
    JOIN {{ ref('mewmew_stg_condition') }} AS condition USING (ftd_key)
)

SELECT 
    * 
FROM source
