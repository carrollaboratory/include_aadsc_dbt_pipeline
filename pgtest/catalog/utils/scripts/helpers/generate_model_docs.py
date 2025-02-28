import yaml
import os
import csv
import pandas as pd
from helpers.general import *

def load_column_data(data_dictionary):
    """Loads column names and descriptions from CSV files once and stores in a dictionary."""
    column_data = {}

    for table_id, table_info in data_dictionary.items():
        ddict = table_info.get("table_details")

        df = read_file(ddict)

    #     column_data[table_id] = [
    #     (
    #         row["variable_name"],  
    #         f'{{{{ doc("{row["variable_name"].lower().replace(" ", "_")}") }}}}' 
    #     )
    #     for _, row in df.iterrows()
    # ]

    #     column_data[table_id] = [
    #         (row["variable_name"], row.get("variable_description", f"UNKNOWN_VARIABLE_DESCRIPTION"))
    #         for _, row in df.iterrows()
    #     ]

    return column_data


def generate_dbt_models_yml(data_dictionary, column_data, output_dir):
    """Generates dbt models.yml file using preloaded column data."""
    models = {"version": 2, "models": []}

    for table_id, table_info in data_dictionary.items():
        model_entry = {
            "name": table_id,
            "description": f"{{{{ doc('{table_id}_description') }}}}",
            "columns": [
                {"name": col_name, "description": f"{{{{ doc('{table_id}_{col_name}') }}}}"}
                for col_name, _ in column_data.get(table_id, [])
            ]
        }

        models["models"].append(model_entry)

    output_file = os.path.join(output_dir, "models.yml")
    with open(output_file, "w") as file:
        yaml.dump(models, file, default_flow_style=False)
    print(f"Generated: {output_file}")

def generate_column_descriptions(data_dictionary, column_data, output_dir):
    """Generates column_descriptions.yml using preloaded column data."""
    descriptions = []

    for table_id, table_info in data_dictionary.items():
        # Table-level description
        table_description = table_info.get("description", f"Model for {table_id}.")
        descriptions.append(f"{{% docs {table_id}_description %}}\n{table_description}\n{{% enddocs %}}\n")

        # Column-level descriptions
        for col_name, var_desc in column_data.get(table_id, []):
            descriptions.append(f"{{% docs {table_id}_{col_name} %}}\n{var_desc}\n{{% enddocs %}}\n")

    output_file = os.path.join(output_dir, "column_descriptions.yml")
    with open(output_file, "w") as file:
        file.writelines(descriptions)
    print(f"Generated: {output_file}")

def generate_model_descriptions(data_dictionary, output_dir):
    """Generates model_descriptions.yml using the specified format."""
    model_descriptions = []

    # Group tables by prefix (e.g., "moo_raw_", "moo_stg_")
    grouped_tables = {}
    for table_id, table_info in data_dictionary.items():
        prefix = table_id.split("_")[0]  # Assumes prefix is the first part of table_id
        grouped_tables.setdefault(prefix, []).append((table_id, table_info))

    for prefix, tables in grouped_tables.items():
        model_descriptions.append(f"### {prefix.capitalize()} Models\n")

        for table_id, table_info in tables:
            description = table_info.get("description", f"Model for {table_id}.")
            model_descriptions.append(f"{{% docs {table_id} %}}\n{description}\n{{% enddocs %}}\n")

    output_file = os.path.join(output_dir, "model_descriptions.yml")
    with open(output_file, "w") as file:
        file.writelines(model_descriptions)

    print(f"Generated: {output_file}")


def generate_model_docs(study_config, study_dir, table_dir, docs_dir):
    """Main function to generate dbt model files, loading column data once."""
    os.makedirs(study_dir, exist_ok=True)
    os.makedirs(table_dir, exist_ok=True)
    os.makedirs(docs_dir, exist_ok=True)

    data_dictionary = study_config.get("data_dictionary", {})
    column_data = load_column_data(data_dictionary) 

    generate_dbt_models_yml(data_dictionary, column_data, table_dir)
    generate_column_descriptions(data_dictionary, column_data, docs_dir)
    generate_model_descriptions(data_dictionary, docs_dir)
