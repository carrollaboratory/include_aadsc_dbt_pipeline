dbt clean
dbt deps  || { echo "Error: dbt deps failed. Exiting..."; exit 1; }
# dbt compile

dbt run --select moo_src_participant
dbt run --select moo_stg_participant
dbt run --select moo_src_condition
dbt run --select moo_stg_condition
dbt run --select moo_ftd_participant
dbt run --select moo_ftd_measurement
dbt run --select moo_ftd_condition
dbt run --select moo_ftd_event
dbt run --select tgt_participant --vars "{source_table: moo_ftd_participant, target_schema: moo_tgt_data}"
dbt run --select tgt_measurement --vars "{source_table: moo_ftd_measurement, target_schema: moo_tgt_data}"
dbt run --select tgt_condition --vars "{source_table: moo_ftd_condition, target_schema: moo_tgt_data}"
dbt run --select tgt_event --vars "{source_table: moo_ftd_condition, target_schema: moo_tgt_data}"

# sanity checks
dbt run-operation print_database_stats --args '{"schema_name": "dbo_src_data"}'
dbt run-operation print_database_stats --args '{"schema_name": "dbo_moo_data"}'
dbt run-operation print_database_stats --args '{"schema_name": "dbo_moo_ftd_data"}'
dbt run-operation print_database_stats --args '{"schema_name": "dbo_moo_tgt_data"}'

