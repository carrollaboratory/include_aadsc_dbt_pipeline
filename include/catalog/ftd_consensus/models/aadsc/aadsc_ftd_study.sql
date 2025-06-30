{{ config(materialized='table', schema='aadsc_data') }}

{% set relation = ref('studies') %}
{% set exclude_columns = ['one','two','three','four'] %}
{% set study_columns = get_columns(relation=relation, exclude=constant_columns) %}


    with 
    source as (
        select
        {% for col in study_columns %}
            "{{ col }}"::text AS "{{ col.lower().replace(" ", "_") }}"
            {% if not loop.last %},{% endif %}
        {% endfor %}
    from {{ ref('studies') }} as s
    WHERE "Study Code" = 'AADSC'
    )

select 
*
from source
    