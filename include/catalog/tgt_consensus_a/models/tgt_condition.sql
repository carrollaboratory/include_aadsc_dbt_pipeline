{{ config(
    schema=var('target_schema')
) }}

{% set source_table = ('aadsc_ftd_condition') %}
{% set source_ref = ref(source_table) %}

{% if source_table is not none %}
  {% do log("Using source_table: " ~ source_table, info=True) %}
  {{ transform_condition(source_ref) }}
{% else %}
  {% do log("Skipping transform_event because source_table is not set.", info=True) %}
{% endif %}
