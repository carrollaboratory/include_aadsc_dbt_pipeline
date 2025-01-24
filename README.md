# dbt_pipeline

# References
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

# Admin login - logs in as postgres, youll need to create a role for yourself then you can log in with that to create a db, etc. You'll need to be an admin to make changes.
sudo -u postgres psql
```
You'll be in postgres sql now, remember semi-colons.
``` sql

-- See more commands in the postgresql docs, some linked above.
-- Create a role
CREATE ROLE {role} LOGIN CREATEDB PASSWORD 'password';

-- WHEN you mess up - Must be of higher status to drop them - admin/sudo or SUPERUSER
DROP ROLE {role};

-- give privilages to a role - i.e. If you make a 'user' role and want another user to inherit the permissions
GRANT {role} to {role}};
GRANT ALL PRIVILEGES ON DATABASE my_database TO my_user;

-- see roles that can login
SELECT rolname FROM pg_roles WHERE rolcanlogin;

-- get out of postgres
\q
```
