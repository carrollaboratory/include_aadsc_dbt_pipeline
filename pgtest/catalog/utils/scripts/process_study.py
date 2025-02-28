import argparse
import yaml
import pandas as pd
import os
import subprocess
from jinja2 import Template

from helpers.generate_model_docs import *
from helpers.general import *


DB_HOST = "localhost"
DB_USER = "gutmanb"
DB_NAME = "default_db"

# def read_file(filepath):
#     if not os.path.exists(filepath):
#         raise Exception(f"File does not exist: {filepath}")

#     file_ext = os.path.splitext(filepath)[-1].lower()

#     if file_ext in [".yaml", ".yml"]:
#         print(f"Reading YAML from file: {filepath}")
#         with open(filepath, "r") as file:
#             data = yaml.safe_load(file)
#         print("YAML data loaded.")
#         return data

#     elif file_ext == ".csv":
#         print(f"Reading CSV from file: {filepath}")
#         data = pd.read_csv(filepath)
#         print("CSV data loaded.")
#         return data

#     else:
#         raise ValueError(f"Unsupported file type: {file_ext}")

def validate_study_config(study_config):
    """
    Validates the study configuration (YAML) for correctness.
     - Must have a data_dictionary(DD) section
     - Must have a data_files(DF) section
     - DDs must have table details
     - DD table_details must have valid paths
     - DD and DF sections must contain data for the same tables
     - DFs must have filenames
     - DFs filenames must have valid paths
    """

    if "data_dictionary" not in study_config or not study_config["data_dictionary"]:
        raise ValueError("Error: The data_dictionary section must have at least one entry.")

    if "data_files" not in study_config or not study_config["data_files"]:
        raise ValueError("Error: The data_files section must have at least one entry.")
    

    data_dictionary = study_config["data_dictionary"]
    data_files = study_config["data_files"]

    table_ids = set()

    for table_id, table_info in data_dictionary.items():
        table_ids.add(table_id)

        if table_info is None:
            raise ValueError(f"Error: Missing details for table_id: {table_id}")

        filename = table_info["table_details"]

        if not os.path.exists(filename):
            raise ValueError(f"Error: Specified data dictionary file does not exist: {filename}")

    # Ensure each table_id in data_files matches one in data_dictionary
    for table_id, data_info in data_files.items():
        if table_id not in table_ids:
            raise ValueError(f"Error: data_files contains table_id '{table_id}' which is missing in data_dictionary.")

        if data_info is None:
            raise ValueError(f"Error: Missing filenames in data_files for table_id: {table_id}")

        # Validate that all file paths exist
        for file in data_info["filename"]:
            if not os.path.exists(file):
                raise ValueError(f"Error: Data file '{file}' does not exist for table_id '{table_id}'.")

    print("Validation passed: Study configuration is valid.")

def extract_table_schema(dd_path):
    """Extracts column definitions from the data dictionary CSV."""
    df = read_file(dd_path)
    column_definitions = []
    for _, row in df.iterrows():

        column_name = row["variable_name"].strip()
        data_type = row["data_type"].strip().upper()

        # Map common data types to PostgreSQL types
        type_mapping = {
            "string": "TEXT",
            "integer": "INTEGER",
            "float": "FLOAT",
            "boolean": "BOOLEAN",
            "datetime": "TIMESTAMP"
        }
        sql_type = type_mapping.get(data_type, "TEXT")
        column_definitions.append(f'"{column_name}" {sql_type}')

    return column_definitions

def generate_new_table(schema, table_name, column_defs):

 # Define the template for the CREATE TABLE statement
    create_table_template = """
    CREATE SCHEMA IF NOT EXISTS {{schema}};

    CREATE TABLE IF NOT EXISTS {{db_name}}.{{schema}}.{{table_name}} (
        {% for column in columns %}
        {{ column }}{% if not loop.last %},{% endif %}
        {% endfor %}
    );
    """

    # Render the SQL statement using Jinja2
    sql_query = Template(create_table_template).render(db_name=DB_NAME,
                                                       columns=column_defs,
                                                       table_name=table_name,
                                                       schema=schema)

    try:
        subprocess.run(
            [
                "dbt",
                "run-operation",
                "run_sql",
                "--args",
                f'{{"sql": "{sql_query.replace("\"", "\\\"")}"}}',
            ],
            check=True,
        )
        print(f"Executed SQL:\n{sql_query}")

    except subprocess.CalledProcessError as e:
        print(f"Error executing DBT operation: {e}")
    except Exception as ex:
        print(f"An unexpected error occurred: {ex}")


def copy_csv_into_new_table(schema, table_name, csv_file):

    # Will error if not a one liner with semi colon
    sql_query = f"""
    \\COPY {schema}.{table_name} FROM '{csv_file}' DELIMITER ',' CSV HEADER;
    """

    try:
        subprocess.run(
            ["psql", "-h", DB_HOST, "-U", DB_USER, "-d", DB_NAME],
            input=sql_query,
            text=True,
            check=True,
        )
        print(f"Executed SQL:\n{sql_query}")

    except subprocess.CalledProcessError as e:
        print(f"Error executing DBT operation: {e}")
    except Exception as ex:
        print(f"An unexpected error occurred: {ex}")

def main(yaml_study_config):
    study_config = read_file(yaml_study_config)

    validate_study_config(study_config)

    schema = f"{study_config['study_id']}_raw_data"

    # for table_id, table_info in study_config["data_dictionary"].items():
    #     dd_path = table_info["table_details"]
    #     column_definitions = extract_table_schema(dd_path)
        
    #     generate_new_table(schema, table_id, column_definitions)
    #     print(f"Table {schema}.{table_id} created successfully.")



    # for table_id, data_info in study_config["data_files"].items():
    #     for csv_file in data_info["filename"]:
    #         copy_csv_into_new_table(schema, table_id, csv_file)
    #         print(f"Data from {csv_file} loaded into {schema}.{table_id}.")

    for table_id, table_info in study_config["data_dictionary"].items():
        study_dir = f'data/{study_config['study_id']}'
        table_dir = f'{study_dir}/models/{table_id}'
        docs_dir = f'{study_dir}/docs'

        generate_model_docs(study_config, study_dir, table_dir, docs_dir)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Initialize DBT transformation for study data.")
    
    parser.add_argument("-y", "--yaml", required=True, help="Path to the YAML study_configuration file")
    
    args = parser.parse_args()

    main(yaml_study_config=args.yaml)
