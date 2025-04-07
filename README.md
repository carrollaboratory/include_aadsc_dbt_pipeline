

## Prerequisits:
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

 ```

## Notes
Careful rerunning the generation script. if worried about overwriting, rename or stage your changes first.

Run from inside project "ftd"

ftd_transformations --> explain create

Study yml creation
 - options, When required...
   - table_details are file names if dd_src is csv, is synapse it will be a syn id
 - Double check, no duplicated tables manually

profiles.yml expectations for file format example in examples

Everywhere there is a m00m00 in the generated docs, this should be replaced by the study_id
If not using the basic filenames in the study.yaml, These should also be replaced - The filenames will also include m00m00, check for these during the study_id replacement.

File definitions - when referenced in the README

Requirements - What is necessary for running the new project only. 

Where the projects are run from need to have a dbt_project.yaml and the packages.yml for the complete pipeline. ATM, the outer dbt_project and packages.yml should be 
updated to include new models and studies. 

Goal: generate a dbt pipeline based on the study config, and available data. Create a new repo that includes the dbt pipeline and all requirements to run. Projects may have differing wrappers for the pipeline, These requirements will have to be integrated with those, when necessary.


### Running scripts
If permission is denied -
-  chmod +x scripts/process_new_study.py
You can also run this to give permission to other run scripts when created 


