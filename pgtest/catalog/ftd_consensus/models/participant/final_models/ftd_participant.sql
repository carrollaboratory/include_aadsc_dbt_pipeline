{{ config(materialized='table') }} --overwrites the config in dbt_project.yml No reason, just for kicks.

WITH source AS (
    SELECT
        "Study Code" AS study_code,
        "Participant Global ID" AS participant_global_id,
        "Participant External ID" AS participant_external_id,
        "Family ID"::TEXT AS family_id,
        "Family Type"::TEXT AS family_type,
        "Father ID"::TEXT AS father_id,
        "Mother ID"::TEXT AS mother_id,
        "Sibling ID"::TEXT AS sibling_id,
        "Other Family Member ID"::TEXT AS other_family_member_id,
        "Family Relationship"::TEXT AS family_relationship,
        "Sex"::TEXT AS sex,
        "Race"::TEXT AS race,
        "Ethnicity"::TEXT AS ethnicity,
        "Down Syndrome Status"::TEXT AS down_syndrome_status,
        "Age at First Patient Engagement"::INTEGER AS age_first_engagement,
        "First Patient Engagement Event"::TEXT AS first_engagement_event,
        "Outcomes Vital Status"::TEXT AS vital_status,
        "Age at Last Vital Status"::INTEGER AS age_last_vital_status
    FROM {{ ref('stg_moo_participant') }}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY study_code) + 1000000 AS ftd_id,
    study_code,
    participant_global_id,
    participant_external_id,
    family_id,
    family_type,
    father_id,
    mother_id,
    sibling_id,
    other_family_member_id,
    family_relationship,
    sex,
    race,
    ethnicity,
    down_syndrome_status,
    age_first_engagement,
    first_engagement_event,
    vital_status,
    age_last_vital_status
FROM source
