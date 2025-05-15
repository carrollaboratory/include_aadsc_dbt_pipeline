{{ config(materialized='table', schema='aecom_data') }}


SELECT 
    c.study_code::TEXT AS "study_code",
    'REQUIRED'::TEXT AS "participant_global_id", -- Need to join to something here
    c.participant_id::TEXT AS "participant_external_id",
    NULL::TEXT AS "family_id",
    'Proband-only'::TEXT AS "family_type", -- Required Enum - no data - guessed the default value
    NULL::TEXT AS "father_id",
    NULL::TEXT AS "mother_id",
    NULL::TEXT AS "sibling_id",
    NULL::TEXT AS "other_family_member_id",
    'Proband'::TEXT AS "family_relationship",  -- Required Enum - no data - guessed the default value
    c.gender::TEXT AS "sex",
    CASE c.race
        WHEN 'White/ Caucasian' THEN 'White'
        WHEN 'Multiracial' THEN 'More than one race'
        ELSE c.race -- Choosing to keep the data, it should error during validation if something unexpected.
    END ::TEXT AS "race",
    c.ethnicity::TEXT AS "ethnicity",
    CASE c.ds_status
        WHEN 'DS' THEN 'T21'
        ELSE 'D21' -- Bad logic - could be T211 - typo would cause a 'Does not have ds' - Take the safe route? or take enums seriously?
        END ::TEXT AS "down_syndrome_status",
    FLOOR(CAST(c.exact_age AS FLOAT) * 365.25)::INTEGER AS "age_at_first_patient_engagement",
    'Enrollment'::TEXT AS "first_patient_engagement_event", -- Required Enum - no data - guessed the default value
    NULL::TEXT AS "outcomes_vital_status",
    NULL::INTEGER AS "age_at_last_vital_status"
FROM {{ ref('aecom_stg_combined') }} AS c
