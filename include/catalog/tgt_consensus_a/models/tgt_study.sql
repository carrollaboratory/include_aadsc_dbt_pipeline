{{ config(
    schema=var('target_schema')
) }}

{% set source_table = ('aadsc_ftd_study') %}

{% if source_table is not none %}
  {% do log("Using source_table: " ~ source_table, info=True) %}
  {{ transform_study(source_table) }}
{% else %}
  {% do log("Skipping transform_event because source_table is not set.", info=True) %}
{% endif %}
