{{ config(
    materialized='table'
) }} --overwrites the config in dbt_project.yml No reason, just for kicks.


WITH src_participant AS (
    SELECT
        ftd_key,
        study_code,
        participant_global_id,
        participant_external_id,
        age_first_engagement,
        first_engagement_event
    FROM {{ ref('moo_stg_participant') }}
)

SELECT
    *
FROM src_participant
