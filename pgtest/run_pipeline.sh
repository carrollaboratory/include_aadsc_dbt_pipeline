# # To initiate a project for the first time
# cd {dbt_project}
# dbt init

# dbt run # Runs the models you defined in your project
# dbt run --select moo_participant_model # name of the model sql file. same as model in dbt_project.yml?
# dbt run --select m00m00.*
# dbt seed --select m00m00.*
# dbt test --select stg_participant_data

#  dbt run-operation delete_all_tables --args '{"schema_name": "dbo_moo_data"}'

# dbt --help

# Run dbt commands (you can change dbt run to any dbt command you need)
dbt clean
dbt deps  || { echo "Error: dbt deps failed. Exiting..."; exit 1; }
# dbt seed 

# Later use dbt build - Builds and tests your selected resources such as models, seeds, snapshots, and tests
dbt run --select m00m00.*
# dbt run --select raw_moo_participant

# dbt run --select stg_moo_participant


# dbt docs generate
# dbt docs serve


# dbt run-operation print_database_stats --args '{"schema_name": "dbo_raw_data"}'

# dbt run-operation print_database_stats --args '{"schema_name": "dbo_moo_data"}'
