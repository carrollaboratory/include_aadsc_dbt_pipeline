dbt clean
dbt deps  || { echo "Error: dbt deps failed. Exiting..."; exit 1; }

# dbt seed --full-refresh

# dbt run --select  aadsc_stg_clinical

# dbt run --select aadsc_ftd_participant
# dbt run --select aadsc_ftd_condition
# dbt run --select aadsc_ftd_study

# dbt test --select aadsc_ftd_participant
# dbt test --select aadsc_ftd_condition
# dbt test --select aadsc_ftd_study

dbt run --select +tgt_participant --vars '{"source_table": "aadsc_ftd_participant", "target_schema": "aadsc_tgt_data"}'
dbt run --select +tgt_condition --vars '{"source_table": "aadsc_ftd_condition", "target_schema": "aadsc_tgt_data"}'
dbt run --select +tgt_study --vars '{"source_table": "aadsc_ftd_study", "target_schema": "aadsc_tgt_data"}'

