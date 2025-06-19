#!/usr/bin/env python

import duckdb
con = duckdb.connect("/tmp/dbt.duckdb")

table_schema = 'main_aadsc_data' # main_aadsc_data main_main

tables = con.execute(
    f"SELECT table_name FROM information_schema.tables WHERE table_schema = '{table_schema}'"
).fetchall()
print(f"INFO: Printing Tables in db: '{table_schema}'\n {tables}\n\n")


for table in ['aadsc_ftd_condition']:
    query = f"SELECT name FROM pragma_table_info('{table_schema}.{table}')"
    result = con.execute( f"SELECT name FROM pragma_table_info({table_schema}.{table})").fetchall()
    print(f"INFO: Running {query}\n {result}\n\n")

    result = con.execute(f"SELECT * FROM {table_schema}.{table} LIMIT 1").fetchall()
    print(f"INFO: Printing {table} data\n {result}\n\n")

    result = con.execute(f"SELECT COUNT(*) FROM {table_schema}.{table} WHERE hpo_code IS NOT NULL OR mondo_code IS NOT NULL OR other_code IS NOT NULL").fetchall()
    print(f"INFO: Printing {table} data\n {result}\n\n")

    result = con.execute(f"SELECT COUNT(*) FROM {table_schema}.{table} WHERE hpo_code IS NULL AND mondo_code IS NULL AND other_code IS NULL ").fetchall()
    print(f"INFO: Printing {table} data\n {result}\n\n")
