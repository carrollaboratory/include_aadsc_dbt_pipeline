{% call run_sql(
    "COPY " ~ table_name ~ " FROM '/path/to/your.csv' 
     DELIMITER ',' 
     CSV HEADER;"
) %}