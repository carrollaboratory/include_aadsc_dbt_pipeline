{{ config(materialized='table') }}

WITH source AS (
    SELECT 
       "Study Code"::TEXT AS "study_code",
       "Participant Global ID"::TEXT AS "participant_global_id",
       "Participant External ID"::TEXT AS "participant_external_id",
       "Family ID"::TEXT AS "family_id",
       "Family Type"::TEXT AS "family_type",
       "Father ID"::TEXT AS "father_id",
       "Mother ID"::TEXT AS "mother_id",
       "Sibling ID"::TEXT AS "sibling_id",
       "Other Family Member ID"::TEXT AS "other_family_member_id",
       "Family Relationship"::TEXT AS "family_relationship",
       "Sex"::TEXT AS "sex",
       "Race"::TEXT AS "race",
       "Ethnicity"::TEXT AS "ethnicity",
       "Down Syndrome Status"::TEXT AS "down_syndrome_status",
       "Age at First Patient Engagement"::INTEGER AS "age_at_first_patient_engagement",
       "First Patient Engagement Event"::TEXT AS "first_patient_engagement_event",
       "Outcomes Vital Status"::TEXT AS "outcomes_vital_status",
       "Age at Last Vital Status"::TEXT AS "age_at_last_vital_status"
    FROM {{ ref('mewmew_raw_participant') }}
)

SELECT 
    *,
    CONCAT(study_code, '-', participant_global_id) AS ftd_key
FROM source
