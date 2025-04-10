

## Prerequisites:
* Run everything from inside your project 'ftd_project' in this case.

## Requirements
pip install -r ../requirements.txt
Synapse API
- https://python-docs.synapse.org/en/stable/tutorials/authentication/
- 

https://rest-docs.synapse.org/rest/org/sagebionetworks/repo/web/controller/TableExamples.html

ENV VARS
- syn PAT
- dbt_pipeline_utils to path

## Setup
### Creating a new Postgres DB 
* The local postgres db will be used to store tables from the pipeline run. You'll
need a new db for each study, but do not need to create new users after creating one
the first time.
# TODO are there installations not mentioned for postgres?

* Useful resources

1. Admin login logs in as postgres, youll need to create a role for yourself then you can log in with that to create a db, etc. You'll need to be an admin to make changes(creating roles, granting permissions, creating dbs, ...).
```bash
sudo -u postgres psql
```
* You'll be in postgres now! Remember your semi-colons. Remember use `\q' to exit postgres.

2. Create a role, give it LOGIN and CREATEDB permission and create a password. (You'll need this password in the .dbt/profiles step).
* In postgres you can add permissions to roles/profiles. This role will allow you to make *permitted* changes to your db without being in sudo. 
* The role is not the user, you'll add a user to this roll later. 
* For more on available commands and roles see the resources linked above.
```sql
CREATE ROLE {my_role} LOGIN CREATEDB PASSWORD '{password}';

-- Example: CREATE ROLE dev_role LOGIN CREATEDB PASSWORD 'my_password';
```
* When you inevitably mess up(or is that just me?), drop the role as a sudo user and try again. That goes for every step in the process. Find the docs, undo what you did, as a sudo user and start fresh.
```sql
DROP ROLE {my_role};

-- See existing roles with permissions. No changes to this query are needed.
SELECT rolname FROM pg_roles WHERE rolcanlogin;

```

3. Create a database
```sql
CREATE DATABASE {db};
```

4. Create a user set the role, and grant privileges to the user
* SUPERUSER permission is usually too much permission to add to a user, but it is necessary for the current data upload strategy.
```sql
CREATE USER {my_user} WITH PASSWORD '{password}';
GRANT {my_role} to {my_user};
GRANT ALL PRIVILEGES ON DATABASE {db} TO {my_user};
ALTER ROLE {my_user} WITH SUPERUSER; -- Necessary to use the COPY query
```

5. Save your configurations then login to postgres as your user. 
```bash
# If you are still in postgres as an admin, exit. Use \q
sudo systemctl restart postgresql

psql -U {my_user} -d {db} -h {host} -p {port}

#Example:  psql -U my_user -d default_db -h localhost -p 5432
```

6. Save your password. This will allow sql queries to run without requiring a password.
```bash
echo "{host}:{port}:{default_db}:{my_user}:{password}" >> ~/.pgpass
# Example: echo "localhost:5432:default_db:my_user:password" >> ~/.pgpass

# Set file permissions
chmod 600 ~/.pgpass 
```
 
 Handy postgres debugging queries. Many of these will error if you have not made any schemas
 ```sql
-- To orient yourself
SELECT current_database(), current_user;

-- Look at your schemas and tables. 
-- Will error if you have not made any schemas
SELECT schemaname, tablename FROM pg_tables;

SELECT schemaname, tablename FROM pg_tables WHERE schemaname NOT LIKE 'pg%' 
AND schemaname NOT LIKE 'information%' AND tablename NOT LIKE 'my_first_dbt_model' 
ORDER BY schemaname;

-- There is a macro in the dbt project catalog/utils dir that will recursively delete tables from a schema. That command is with the dbt instructions.
DROP TABLE pg_tables.{your_table_name};

--Drops all tables in the schema
DROP SCHEMA dbo_aecom_data CASCADE;

-- To look at data
--If in the terminal run `\x` to print in expanded view.
SELECT * FROM schemaname.tablename LIMIT 50

 ```

## Notes
Careful rerunning the generation script. if worried about overwriting, rename or stage your changes first.

Run from inside project "ftd"



ftd_transformations --> explain create

Study yml creation
 - options, When required...
   - table_details are file names if dd_src is csv, is synapse it will be a syn id
 - Double check, no duplicated tables manually

 FTD study yml

profiles.yml expectations for file format example in examples

Everywhere there is a m00m00 in the generated docs, this should be replaced by the study_id
If not using the basic filenames in the study.yaml, These should also be replaced - The filenames will also include m00m00, check for these during the study_id replacement.

File definitions - when referenced in the README

Requirements - What is necessary for running the new project. 
- Unnecessary imports/files/dirs in this repo that don't NEED to be carried over.
  - Anything in the .gitignore. Don't accidentally push any data or secrets!
  - dbt_pipeline/macros
  - requirements.txt - Utils import
  - dbt_pipeline/scripts/generate_model_docs + import_data

Where the projects are run from need to have a dbt_project.yaml and the packages.yml for the complete pipeline. ATM, the outer dbt_project and packages.yml should be 
updated to include new models and studies. 

Goal: generate a dbt pipeline based on the study config, and available data. Create a new repo that includes the dbt pipeline and all requirements to run. Projects may have differing wrappers for the pipeline, These requirements will have to be integrated with those, when necessary.


### Running scripts
If permission is denied -
-  chmod +x scripts/process_new_study.py
You can also run this to give permission to other run scripts when created 

Data prerequisites 
 - src {study}_study.yaml and associated datafiles in data/study
 - ftd_study.yaml

1. Run dbt clean and dbt deps in the terminal.
 - ERROR 'some model doesn't have a dbt_project.yml' --> check the packages.yml, make sure the models are not defined there at this time. 
2. Log into the db
3. If the src data doesn't already exist in the pipeline database.
- log into db
- Import src data using ./scripts/import_data.p -s {study_id}
- Ensure the data was imported
- The import scripyt will not overwrite data if it already exists. If you have to recreate the table(incorrect src dd), or reinsert the data. The table must be deleted from the db. 
  ```sql 
DROP TABLE schema_name.table_name;
```
4. Run the dbt model generation script ./scripts/generate_model_docs.py
After running this script some things will need to be updated to account for study specifics before running the dbt run models. There will most likely be extra model docs created.
- Search the new docs for the presence of m00m00, this is the study_id placeholder. In most places it will be a 1 to 1 replacement, but not always. Ex tgt_consensus dbt_project.yml source_table var. That should contain the name of one of the source tables in the database. If this is not an existing table in the db, dbt will error.

WARNING: Once you start making edits to files, and before running the doc generation script again, keep in mind that rerunning the generation, may or may not overwrite files.
- .sql files will not be overwritten. To reginerate, delete the current file.
- /docs files. These will not be overwritten.


5. Work on the transformations.
- Work on a single transformation at a time, and test the model with dbt before moving on to the next stage. Each src model will have to pass before moving on to ftd_consensus stage. ftd_consensus models will be pulling from multiples stg sources most likely and will need those passing models available. When you are done testing the source models, remember you'll have to import the ftd_consensus within the root dir's packages.yml. This will apply when you are ready to move on to test the tgt models.
- You could test the sql by running dbt commands in the command line. Examples of run commands are in /scripts/examples/ex_run_commands.sh. Run dbt clean and dbt deps each time, before running dbt commands. Suggestion, edit 'ex_run_commands.sh' and run it with the commands you want to run while testing. Debugging tip: Running single model model commands will give better logging outputs when there are failures. When one model runs successfully, add the next model to the list of commands to run. Build up the run commands
  - Rerunning the doc generation script on a 'bad' data dictionary may cause issues in docs/column_descriptions.md files. Suggestion, delete all data in the problem file, and rerun the generation. Remember the warning above, make sure you don't overwrite your work when running the generation script.


- Passing models:
  - Running each mo

Common Development Errors:
- Issues with /doc files
  - These files are not overwritten with each generation of the models which is necessary. However, if data dictionaries are updated these files can start causing issues. Best practice would be to delete these files and regenerate them after all changes to data dictionaries have been made.
- Regarding missing dbt_project.yml files
  - Most likely due to incorrect models being imported in dbt_pipeline/packages.yml