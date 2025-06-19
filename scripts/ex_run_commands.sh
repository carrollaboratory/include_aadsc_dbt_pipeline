dbt clean
dbt deps  || { echo "Error: dbt deps failed. Exiting..."; exit 1; }
# dbt seed

# dbt run --select  aadsc_stg_clinical
# dbt run --select aadsc_ftd_participant
dbt run --select aadsc_ftd_condition
