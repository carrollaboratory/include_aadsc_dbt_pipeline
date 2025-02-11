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
dbt seed 

# Later use dbt build - Builds and tests your selected resources such as models, seeds, snapshots, and tests
# dbt run --select m00m00.*
dbt run --select stg_moo_participant2 
# --vars '{"schema_name": "raw_data2", "table_name": "participants_M00M002", "csv_url": "https://github.com/include-dcc/M00M00_test_study/participants_M00M00.csv"}'
# dbt run --select stg_moo_condition # for a single model at a time


# dbt run --select fhir_modules.* 
# dbt run --select ftd_consensus # for a single model at a time
# dbt run --select ftd_consensus # for a single model at a time


# dbt docs generate
# dbt docs serve

dbt run-operation print_database_stats --args '{"schema_name": "dbo_moo_data"}'
# dbt run-operation import_csv --args '{"schema_name": "raw_data2", "table_name": "participants_M00M002", "csv_url": "https://github.com/include-dcc/M00M00_test_study/participants_M00M00.csv"}'
# dbt run-operation  run_python_script --args '{"filepath": "../data/participantsM00M00.csv"}'