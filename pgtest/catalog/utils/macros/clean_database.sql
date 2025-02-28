{% macro delete_all_tables(schema_name) %}
    {% set query %}
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = '{{ schema_name }}'
    {% endset %}
    {% set results = run_query(query) %}
    {% if execute %}
        {% for row in results %}
            {% set drop_query %}
                DROP TABLE IF EXISTS {{ schema_name }}.{{ row['table_name'] }} CASCADE;
            {% endset %}
            {{ log("Dropping table: " ~ schema_name ~ "." ~ row['table_name'], info=True) }}
            {% do run_query(drop_query) %}
        {% endfor %}
    {% endif %}
{% endmacro %}
