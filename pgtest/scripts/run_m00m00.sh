#!/bin/bash
set -e  # Exit on error
dbt clean
dbt deps || { echo "Error: dbt deps failed. Exiting..."; exit 1; }
# Run Target tables
dbt run --select +tgt_participant --vars '{"source_table": "m00m00_ftd_participant", "target_schema": "m00m00_tgt_data"}'
dbt run --select +tgt_condition --vars '{"source_table": "m00m00_ftd_condition", "target_schema": "m00m00_tgt_data"}'
dbt run --select +tgt_event --vars '{"source_table": "m00m00_ftd_event", "target_schema": "m00m00_tgt_data"}'
dbt run --select +tgt_measurement --vars '{"source_table": "m00m00_ftd_measurement", "target_schema": "m00m00_tgt_data"}'
# Run sanity checks
dbt run-operation print_database_stats --args '"schema_name": "dbo_raw_data"'
dbt run-operation print_database_stats --args '"schema_name": "dbo_m00m00_data"'
dbt run-operation print_database_stats --args '"schema_name": "dbo_m00m00_ftd_data"'
dbt run-operation print_database_stats --args '"schema_name": "dbo_m00m00_tgt_data"'
