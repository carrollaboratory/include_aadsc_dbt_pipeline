{% macro transform_measurement(source_table) %}
WITH src_condition AS (
    SELECT
        ftd_key,
        study_code,
        participant_global_id,
        participant_external_id,
        measurement_source_text,
        age_at_measurement_observation,
        interpretation,
        _status,
        _data_source,
        other_label,
        other_code,
        measure_value,
        measure_unit
    FROM {{ ref(source_table) }}
)
SELECT * FROM src_condition
WHERE measure_value IS NOT NULL -- place logic here that includes measurements
{% endmacro %}
