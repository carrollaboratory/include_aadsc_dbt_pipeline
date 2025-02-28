{% macro transform_participant(source_table) %}
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
    FROM {{ ref(source_table) }}
)

SELECT
    *
FROM src_participant
{% endmacro %}
