dbt clean
dbt deps  || { echo "Error: dbt deps failed. Exiting..."; exit 1; }
# dbt compile

dbt run --select arf_raw_participant
dbt run --select arf_stg_participant
dbt run --select arf_raw_condition
dbt run --select arf_stg_condition
dbt run --select arf_ftd_participant
dbt run --select arf_ftd_measurement
dbt run --select arf_ftd_condition
dbt run --select arf_ftd_event
dbt run --select tgt_participant --vars "{source_table: arf_ftd_participant, target_schema: arf_tgt_data}"
dbt run --select tgt_measurement --vars "{source_table: arf_ftd_measurement, target_schema: arf_tgt_data}"
dbt run --select tgt_condition --vars "{source_table: arf_ftd_condition, target_schema: arf_tgt_data}"
dbt run --select tgt_event --vars "{source_table: arf_ftd_condition, target_schema: arf_tgt_data}"

# sanity checks
dbt run-operation print_database_stats --args '{"schema_name": "dbo_raw_data"}'
dbt run-operation print_database_stats --args '{"schema_name": "dbo_arf_data"}'
dbt run-operation print_database_stats --args '{"schema_name": "dbo_arf_ftd_data"}'
dbt run-operation print_database_stats --args '{"schema_name": "dbo_arf_tgt_data"}'
