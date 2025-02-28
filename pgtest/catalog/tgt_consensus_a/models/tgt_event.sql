
{{ config(
    schema=var('target_schema')
) }}

{% set source_table = var('source_table') %}

-- The if statement keeps the dbt compile from failing while reconsiling 'source_table'
{% if source_table is not none %}
  {% do log("Using source_table: " ~ source_table, info=True) %}
  {{ transform_event(source_table) }}
{% endif %}
