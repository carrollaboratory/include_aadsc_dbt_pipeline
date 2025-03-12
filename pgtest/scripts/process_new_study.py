import argparse
from dbt_utils.scripts.process_study import main

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run ETL script with arguments.")
    parser.add_argument("-s", "--study_id", required=True, help="The study identifier.")
    args = parser.parse_args()

    main(study_id=args.study_id)
    
