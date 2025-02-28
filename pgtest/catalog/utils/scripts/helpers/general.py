import os
import yaml
import pandas as pd

def read_file(filepath):
    if not os.path.exists(filepath):
        raise Exception(f"File does not exist: {filepath}")

    file_ext = os.path.splitext(filepath)[-1].lower()

    if file_ext in [".yaml", ".yml"]:
        print(f"Reading YAML from file: {filepath}")
        with open(filepath, "r") as file:
            data = yaml.safe_load(file)
        print("YAML data loaded.")
        return data

    elif file_ext == ".csv":
        print(f"Reading CSV from file: {filepath}")
        data = pd.read_csv(filepath)
        print("CSV data loaded.")
        return data

    else:
        raise ValueError(f"Unsupported file type: {file_ext}")