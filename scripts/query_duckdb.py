#!/usr/bin/env python

import duckdb

# Connect to DuckDB
con = duckdb.connect("/tmp/dbt.duckdb")

# Schema and table setup
table_schema = 'main_aadsc_data'  # main_aadsc_data main_main

# Function to truncate rows for better readability
def format_rows(rows):
    formatted = []
    for row in rows:
        row_str = str(row)
        formatted.append(row_str)
    return formatted

# Fetch tables in the specified schema
tables = con.execute(
    f"SELECT table_name FROM information_schema.tables WHERE table_schema = '{table_schema}'"
).fetchall()
print(f"\nINFO: Tables in schema '{table_schema}':\n")
for table in format_rows(tables):
    print(table)

# Process each table
for table in ['aadsc_ftd_condition']:
    print(f"\nINFO: Processing table '{table_schema}.{table}'...\n")

    # Fetch column names of the table
    query = f"SELECT name FROM pragma_table_info('{table_schema}.{table}')"
    column_names = con.execute(query).fetchall()
    print(f"INFO: Columns in table '{table}':")
    for col in format_rows(column_names):
        print(col)

    columns = [col[0] for col in column_names]
    columns_to_select = [col for col in columns if col not in ['participant_external_id', 'maxo_label', 'maxo code', 'measure_unit','measure_code'] ]
    columns_str = ", ".join(columns_to_select)


    # Fetch first 5 rows ordered by ftd_index
    rows = con.execute(f"SELECT {columns_str} FROM {table_schema}.{table} ORDER BY ftd_index LIMIT 5").fetchall()
    print(f"\nINFO: First 5 rows in table '{table}':")
    for row in format_rows(rows):
        print(row)

    # Count rows where one of the columns is NOT NULL
    count_not_null = con.execute(
        f"SELECT COUNT(*) FROM {table_schema}.{table} WHERE hpo_code IS NOT NULL OR mondo_code IS NOT NULL OR other_code IS NOT NULL"
    ).fetchall()
    print(f"\nINFO: Count of rows where one column is NOT NULL:")
    for row in format_rows(count_not_null):
        print(row)

    # # Count rows where all columns are NULL
    # count_all_null = con.execute(
    #     f"SELECT COUNT(*) FROM {table_schema}.{table} WHERE hpo_code IS NULL AND mondo_code IS NULL AND other_code IS NULL"
    # ).fetchall()
    # print(f"\nINFO: Count of rows where all columns are NULL:")
    # for row in format_rows(count_all_null):
    #     print(row)

    ## Fetch rows where all columns are NULL (limit 10)
    # rows_all_null = con.execute(
    # f"SELECT {columns_str} FROM {table_schema}.{table} WHERE hpo_code IS NULL AND mondo_code IS NULL AND other_code IS NULL ORDER BY ftd_index LIMIT 10"
    # ).fetchall()
    # print(f"\nINFO: Rows where all columns are NULL (limited to 10):")
    # for row in format_rows(rows_all_null):
    #     print(row)

    # Count rows where all columns are NULL
    count_reg = con.execute(
        f"SELECT COUNT(*) FROM {table_schema}.{table} WHERE hpo_code IS NULL AND mondo_code IS NULL"
    ).fetchall()
    print(f"\nINFO: Count of rows where missing mondo and hp codes:")
    for row in format_rows(count_reg):
        print(row)