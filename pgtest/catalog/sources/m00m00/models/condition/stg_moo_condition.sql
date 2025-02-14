{{ config(materialized='table') }} --overwrites the config in dbt_project.yml No reason, just for kicks.

    WITH source AS (
        SELECT
            "Study Code" AS study_code,
            "Participant Global ID" AS participant_global_id,
            "Participant External ID" AS participant_external_id,
            "Event ID" AS event_id,
            "Event Type" AS event_type,
            "Condition or Measure Source Text" AS condition_measure_source_text,
            "Age at Condition or Measure Observation"::INTEGER AS age_at_condition_measure_observation,
            "Condition Interpretation" AS condition_interpretation,
            "Condition Status" AS condition_status,
            "Condition Data Source" AS condition_data_source,
            "HPO Label" AS hpo_label,
            "HPO Code" AS hpo_code,
            "MONDO Label" AS mondo_label,
            "MONDO Code" AS mondo_code,
            "MAXO Label" AS maxo_label,
            "MAXO Code" AS maxo_code,
            "Other Label" AS other_label,
            "Other Code" AS other_code,
            "Measure Value" AS measure_value,
            "Measure Unit" AS measure_unit
    FROM {{ ref('raw_moo_condition') }}
    )

    SELECT *
    FROM source

