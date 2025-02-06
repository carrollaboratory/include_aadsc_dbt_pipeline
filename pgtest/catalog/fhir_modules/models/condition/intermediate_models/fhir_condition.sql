{{ config(materialized='table') }} --overwrites the config in dbt_project.yml No reason, just for kicks.

    WITH source AS (
        SELECT
        ftd_id,
        study_code,
        participant_global_id,
        participant_external_id,
        event_id,
        event_type,
        condition_measure_source_text,
        age_at_condition_measure_observation,
        condition_interpretation,
        condition_status,
        condition_data_source,
        hpo_label,
        hpo_code,
        mondo_label,
        mondo_code,
        maxo_label,
        maxo_code,
        other_label,
        other_code,
        measure_value,
        measure_unit
    FROM {{ ref('stg_moo_condition') }}
    )

    SELECT *
    FROM source

