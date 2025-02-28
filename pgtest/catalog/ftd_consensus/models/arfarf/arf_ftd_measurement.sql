{{ config(
    materialized='table'
) }} --overwrites the config in dbt_project.yml No reason, just for kicks.


WITH src_condition AS (
    SELECT
        ftd_key,
        study_code,
        participant_global_id,
        participant_external_id,
        condition_measure_source_text as measurement_source_text,
        age_at_condition_measure_observation as age_at_measurement_observation,
        condition_interpretation as interpretation,
        condition_status as _status,
        condition_data_source as _data_source,
        other_label,
        other_code,
        measure_value,
        measure_unit

    FROM {{ ref('arf_stg_condition') }}
)

SELECT
    *
FROM src_condition
