{% macro transform_condition(source_table) %}
WITH src_condition AS (
    SELECT
        ftd_key,
        down_syndrome_status,
        age_first_engagement,
        first_engagement_event,
        vital_status,
        age_last_vital_status,
        study_code,
        participant_global_id,
        participant_external_id,
        event_id,
        event_type,
        condition_source_text,
        age_at_condition,
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
    FROM {{ ref(source_table) }}
)


SELECT
    c.study_code,
    c.participant_global_id,
    c.participant_external_id,
    c.event_id,
    c.event_type,
    c.condition_source_text,
    c.age_at_condition,
    c.condition_interpretation,
    c.condition_status,
    c.condition_data_source,
    c.hpo_label,
    c.hpo_code,
    c.mondo_label,
    c.mondo_code,
    c.maxo_label,
    c.maxo_code,
    c.other_label,
    c.other_code,
    c.measure_value,
    c.measure_unit
FROM src_condition c
{% endmacro %}
