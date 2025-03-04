import argparse
import subprocess
import sys
import os
from scripts.helpers.common import FTD_TABLES

def run_process_study():
    parser = argparse.ArgumentParser(description="Run ETL script with arguments.")
    parser.add_argument("-y", "--yaml_study_config", required=True, help="Path to the study config YAML file.")
    args = parser.parse_args()


    yaml_study_config_path = os.path.abspath(args.yaml_study_config)
    print(f"Running ETL script with config: {yaml_study_config_path}")


    command = [
        sys.executable, 
        "-m", "dbt_utils.scripts.process_study",
        "-y", yaml_study_config_path,
        
    ]
    command.append("-t")
    for table in FTD_TABLES:
        command.append(table)


    try:
        subprocess.run(command, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error running process_study: {e}")
        sys.exit(1)


if __name__ == "__main__":
    run_process_study()
