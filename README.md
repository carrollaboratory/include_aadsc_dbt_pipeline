# dbt_pipeline

# References
https://learn.getdbt.com/catalog
https://www.postgresql.org/docs/current/database-roles.html
https://www.postgresql.org/docs/current/tutorial-createdb.html
https://medium.com/refined-and-refactored/building-a-dbt-project-from-scratch-3789e937f15a
https://medium.com/@jewelski/configure-my-dbt-core-side-project-using-my-local-postgres-database-f31c998ab6f3
  

copy the dbt generated profiles data into the new file, or move the file, whatever.

``` bash
mkdir ~/.dbt
touch ~/.dbt/profiles.yml

nano ~/.dbt/profiles.yml
# Ctrl O , Enter, Ctrl X  =  Save, accept, exit

Set env_vars in the profiles.yml


# Admin login - logs in as postgres, youll need to create a role for yourself then you can log in with that to create a db, etc. You'll need to be an admin to make changes.
sudo -u postgres psql
```
You'll be in postgres sql now, remember semi-colons.
``` sql

-- See more commands in the postgresql docs, some linked above.
-- Create a role
CREATE ROLE {role} LOGIN CREATEDB PASSWORD '{}';

-- WHEN you mess up - Must be of higher status to drop them - admin/sudo or SUPERUSER
DROP ROLE {role};

-- give privilages to a role - i.e. If you make a 'user' role and want another user to inherit the permissions
GRANT {role} to {role}};
GRANT ALL PRIVILEGES ON DATABASE my_database TO my_user;

CREATE DATABASE default_db;
CREATE USER {} WITH PASSWORD '{}}';
GRANT ALL PRIVILEGES ON DATABASE default_db TO gutmanb;


-- see roles that can login
SELECT rolname FROM pg_roles WHERE rolcanlogin;

--to use copy youll need to be a superuser
psql -h $DB_HOST -U postgres -d $DB_NAME
ALTER ROLE your_user WITH SUPERUSER;


-- get out of postgres
\q

sudo systemctl start postgresql
sudo systemctl enable postgresql

--login 
psql -U gutmanb -d default_db -h localhost -p 5432
-- Will ask you for your word, you can set it as a default here
echo "localhost:5432:default_db:{role}}:{pass}" >> ~/.pgpass
chmod 600 ~/.pgpass

-- where are you at?
SELECT current_database(), current_user;
-- what tables/schemas
SELECT schemaname, tablename FROM pg_tables;

SELECT schemaname, tablename FROM pg_tables WHERE schemaname NOT LIKE 'pg%' 
AND schemaname NOT LIKE 'information%' AND tablename NOT LIKE 'my_first_dbt_model' 
ORDER BY schemaname;
-- or
\dt dbo_seed_data.* -- \dt 

-- query
-- Suggestion all lowercase and you don't need quotes

--  from the utils dir, Clean out db by individual schema
 dbt run-operation delete_all_tables --args '{"schema_name": "dbo_moo_data"}'
 python scripts/process_data.py -f data/participants_M00M00.csv -t participants_m00m002 --ran it from utils
```

# Notes 

## General
* VSCode ext - 'Power User for dbt'
* dbt_project.yml file was erroring - vscode didn't see dbt installed.
Ctrl + Shift + P > select python interpreter > set to response from 'which python' in the terminal

## requirements.txt notes
* holds installations via pip. dbt installations go in packages.yml. https://docs.getdbt.com/docs/build/packages#how-do-i-add-a-package-to-my-project
* psycopg2-binary is installed by default when installing dbt-postgres https://docs.getdbt.com/docs/core/connect-data-platform/postgres-setup

