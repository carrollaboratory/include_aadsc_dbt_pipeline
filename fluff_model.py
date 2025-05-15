#!/usr/bin/env python3

import argparse
import subprocess
import sys
from pathlib import Path

def main():
    parser = argparse.ArgumentParser(
        description="Lint nested dbt model directories with sqlfluff."
    )
    parser.add_argument("--model", "-m", choices=["sources", "ftd", "tgt"], required=True, help="Project model name")
    parser.add_argument("--study", "-s", required=True, help="Study name (required for sources)")

    args = parser.parse_args()

    PROJECTS = {
        "sources": Path(f"include/catalog/sources/{args.study}/models"),
        "ftd": "include/catalog/ftd_consensus/models",
        "tgt": "include/catalog/tgt_consensus_a/models",
    }

    model_path = PROJECTS.get(args.model)
    path = Path(model_path).resolve()

    cmd = ["sqlfluff", "lint", str(path)]

    print(f"Running: {' '.join(cmd)}")
    result = subprocess.run(cmd)
    sys.exit(result.returncode)

if __name__ == "__main__":
    main()
