{{ config(
    materialized='table'
) }} --overwrites the config in dbt_project.yml No reason, just for kicks.


WITH src_participant AS (
    SELECT
        ftd_key,
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
        ethnicity
    FROM {{ ref('arf_stg_participant') }}
)

SELECT
    *
FROM src_participant
