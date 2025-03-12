{{ config(materialized='table', schema='mewmew_data') }}

WITH source AS (
    SELECT 
       participant.ftd_key::TEXT AS "ftd_key",
       participant.study_code::TEXT AS "study_code",
       participant.participant_global_id::TEXT AS "participant_global_id",
       participant.participant_external_id::TEXT AS "participant_external_id",
       participant.family_id::TEXT AS "family_id",
       participant.family_type::TEXT AS "family_type",
       participant.father_id::TEXT AS "father_id",
       participant.mother_id::TEXT AS "mother_id",
       participant.sibling_id::TEXT AS "sibling_id",
       participant.other_family_member_id::TEXT AS "other_family_member_id",
       participant.family_relationship::TEXT AS "family_relationship",
       participant.sex::TEXT AS "sex",
       participant.race::TEXT AS "race",
       participant.ethnicity::TEXT AS "ethnicity"
    FROM {{ ref('mewmew_stg_participant') }} AS participant
    JOIN {{ ref('mewmew_stg_condition') }} AS condition USING (ftd_key)
)

SELECT 
    * 
FROM source
