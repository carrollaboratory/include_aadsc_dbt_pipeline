{% macro print_database_stats(schema_name) %}
    {% set query %}
        SELECT 
            table_name,
            pg_size_pretty(pg_total_relation_size('"' || table_schema || '"."' || table_name || '"')) AS table_size,
            reltuples::bigint AS estimated_rows
        FROM information_schema.tables
        JOIN pg_class ON tables.table_name = pg_class.relname
        WHERE table_schema = '{{ schema_name }}'
        ORDER BY estimated_rows DESC;
    {% endset %}

    {% set results = run_query(query) %}

    {% if execute %}
        {{ log("Database Stats for Schema: " ~ schema_name, info=True) }}
        {% for row in results %}
            {{ log("Table: " ~ row['table_name'] ~ " | Size: " ~ row['table_size'] ~ " | Rows: " ~ row['estimated_rows'], info=True) }}
        {% endfor %}
    {% endif %}
{% endmacro %}
