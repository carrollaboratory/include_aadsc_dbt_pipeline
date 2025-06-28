#!/usr/bin/env python

import duckdb
from scripts.helpers import logger
con = duckdb.connect("/tmp/dbt.duckdb")

stage = 'tgt'


# Function to truncate rows for better readability
def format_rows(rows):
    formatted = []
    for row in rows:
        row_str = str(row).replace(',','').replace('(','').replace(')','')
        formatted.append(row_str)
    return formatted


if stage == 'ftd':

    # Schema and table setup
    table_schema = 'main_aadsc_data'  # main_aadsc_data main_main

    # Fetch tables in the specified schema
    tables = con.execute(
        f"SELECT table_name FROM information_schema.tables WHERE table_schema = '{table_schema}'"
    ).fetchall()
    logger.info(f"\nTables in schema '{table_schema}':\n")
    for table in format_rows(tables):
        logger.info(table)

    # Process each table
    for table in ['aadsc_ftd_participant']:
        logger.info(f"\nProcessing table '{table_schema}.{table}'...\n")

        # Fetch column names of the table
        query = f"SELECT name FROM pragma_table_info('{table_schema}.{table}')"
        column_names = con.execute(query).fetchall()
        logger.info(f"Columns in table '{table}':")
        for col in format_rows(column_names):
            logger.info(col)

        columns = [col[0] for col in column_names]
        columns_to_select = [col for col in columns if col not in ['participant_external_id', 'maxo_label', 'maxo code', 'measure_unit','measure_code'] ]
        columns_str = ", ".join(columns_to_select)


        # Fetch first 5 rows ordered by ftd_index
        rows = con.execute(f"SELECT {columns_str} FROM {table_schema}.{table} ORDER BY ftd_index LIMIT 5").fetchall()
        logger.info(f"\nFirst 5 rows in table '{table}':")
        for row in format_rows(rows):
            logger.info(row)

        # Count rows where one of the columns is NOT NULL
        # count_not_null = con.execute(
        #     f"SELECT COUNT(*) FROM {table_schema}.{table} WHERE hpo_code IS NOT NULL OR mondo_code IS NOT NULL OR other_code IS NOT NULL"
        # ).fetchall()
        # logger.info(f"\nCount of rows where one column is NOT NULL:")
        # for row in format_rows(count_not_null):
        #     logger.info(row)

        # # Count rows where all columns are NULL
        # count_all_null = con.execute(
        #     f"SELECT COUNT(*) FROM {table_schema}.{table} WHERE hpo_code IS NULL AND mondo_code IS NULL AND other_code IS NULL"
        # ).fetchall()
        # logger.info(f"\nCount of rows where all columns are NULL:")
        # for row in format_rows(count_all_null):
        #     logger.info(row)

        ## Fetch rows where all columns are NULL (limit 10)
        # rows_all_null = con.execute(
        # f"SELECT {columns_str} FROM {table_schema}.{table} WHERE hpo_code IS NULL AND mondo_code IS NULL AND other_code IS NULL ORDER BY ftd_index LIMIT 10"
        # ).fetchall()
        # logger.info(f"\nRows where all columns are NULL (limited to 10):")
        # for row in format_rows(rows_all_null):
        #     logger.info(row)

        # Count rows where all columns are NULL
        # count_reg = con.execute(
        #     f"SELECT condition_or_measure_source_text, COUNT(*) FROM {table_schema}.{table} WHERE hpo_code IS NULL AND mondo_code IS NULL GROUP BY condition_or_measure_source_text"
        # ).fetchall()
        # logger.info(f"\nCount disctinct conditions where missing mondo and hp codes:")
        # for row in format_rows(count_reg):
        #     logger.info(row)


        # to_csv = con.execute(
        #     f"COPY (SELECT ftd_index, condition_or_measure_source_text, count(condition_or_measure_source_text) FROM {table_schema}.{table} GROUP BY ftd_index, condition_or_measure_source_text HAVING count(condition_or_measure_source_text) > 1 ORDER BY condition_or_measure_source_text LIMIT 100) TO 'output.csv' (HEADER, DELIMITER ',')"
        # ).fetchall()
        # logger.info(f"\nResult logger.infoed to output csv {table}")
        
        dist_cond = con.execute(
            f"SELECT distinct ethnicity FROM {table_schema}.{table}"
        ).fetchall()
        logger.info(f"\nView distinct extraction dates:")
        for row in format_rows(dist_cond):
            logger.info(row)

        to_csv = con.execute(
            f"COPY (SELECT ftd_index, condition_or_measure_source_text, count(condition_or_measure_source_text) FROM {table_schema}.{table} WHERE ftd_index in (SELECT ftd_index FROM {table_schema}.{table} GROUP BY ftd_index HAVING count(distinct condition_or_measure_source_text) > 1 ORDER BY ftd_index LIMIT 100) GROUP BY ftd_index, condition_or_measure_source_text ORDER BY ftd_index) TO 'output.csv' (HEADER, DELIMITER ',')"
        ).fetchall()
        logger.info(f"\nResult logger.infoed to output csv {table}")

        
        to_csv = con.execute(
            f"COPY (SELECT condition_or_measure_source_text, other_code FROM {table_schema}.{table} WHERE hpo_code IS NULL AND mondo_code IS NULL GROUP BY condition_or_measure_source_text, other_code ORDER BY condition_or_measure_source_text LIMIT 100) TO 'output.csv' (HEADER, DELIMITER ',')"
        ).fetchall()
        logger.info(f"\nResult logger.infoed to output csv {table}")




if stage == 'src':

    table_schema = 'main_main'  # main_aadsc_data main_main

    # Fetch tables in the specified schema
    tables = con.execute(
        f"SELECT table_name FROM information_schema.tables WHERE table_schema = '{table_schema}'"
    ).fetchall()
    logger.info(f"\nTables in schema '{table_schema}':\n")
    for table in format_rows(tables):
        logger.info(table)

    for table in ['aadsc_stg_clinical']:
        logger.info(f"\nProcessing table '{table_schema}.{table}'...\n")

        # Fetch column names of the table
        query = f"SELECT name FROM pragma_table_info('{table_schema}.{table}') LIMIT 20"
        column_names = con.execute(query).fetchall()
        logger.info(f"Columns in table '{table}':")
        for col in format_rows(column_names):
            logger.info(col)

        to_csv = con.execute(
            f"COPY (SELECT DISTINCT cardiac_pfo_age,cardiac_pda_age,skin_acne_age,skin_alopecia_age,cardiac_asd_age,cardiac_tof_age,cardiac_vsd_age FROM {table_schema}.{table}) TO 'output_src.csv' (HEADER, DELIMITER ',')"
        ).fetchall()
        logger.info(f"\nResult logger.infoed to output_src csv.")


        extraction_date = con.execute(
            f"SELECT distinct extraction_date FROM {table_schema}.{table}"
        ).fetchall()
        logger.info(f"\nView distinct extraction dates:")
        for row in format_rows(extraction_date):
            logger.info(row)




if stage == 'seed':

    table_schema = 'main'  # main_aadsc_data main_main

        # Process each table
    for table in ['aadsc_enums']:
        logger.info(f"\nProcessing table '{table_schema}.{table}'...\n")

        # Fetch column names of the table
        query = f"SELECT name FROM pragma_table_info('{table_schema}.{table}')"
        column_names = con.execute(query).fetchall()
        logger.info(f"Columns in table '{table}':")
        for col in format_rows(column_names):
            logger.info(col)

        to_csv = con.execute(
            f"COPY (SELECT DISTINCT condition_name FROM {table_schema}.{table} GROUP BY condition_name, mondo_codes_with_prefix,hpo_codes_with_prefix HAVING COUNT(condition_name)>1 AND mondo_codes_with_prefix IS NOT NULL AND hpo_codes_with_prefix IS NOT NULL) TO 'output_seed.csv' (HEADER, DELIMITER ',')"
        ).fetchall()
        logger.info(f"\nResult printed to output_src csv.")


if stage == 'tgt':

    #  tgt tables
    table_schema = 'main_aadsc_tgt_data'

        # Process each table
    for table in [
                #   'tgt_condition', 
                  'tgt_participant'
                  ]:
        logger.info(f"\nProcessing {stage} table '{table_schema}.{table}'...\n")

        # Fetch column names of the table
        query = f"SELECT name FROM pragma_table_info('{table_schema}.{table}')"
        column_names = con.execute(query).fetchall()
        logger.info(f"Columns in table '{table}':")
        for col in format_rows(column_names):
            logger.info(col)  


        for i in ['studyCode','sex','race','ethnicity','downSyndromeStatus','outcomesVitalStatus', 'familyType']:
            query = f"SELECT DISTINCT {i} FROM {table_schema}.{table}"
            check_enums = con.execute(query).fetchall()
            logger.info(f"\n\nVIEW ENUMS FOR '{table}' '{i}':")
            for col in format_rows(check_enums):
                logger.info(col)  

        participant_required_cols=['studyCode','participantGlobalId','participantExternalId','familyType','familyRelationship','sex','race','ethnicity','downSyndromeStatus','ageAtFirstParticipantEngagement']

        for i in participant_required_cols:
            query = f"SELECT COUNT({i}) FROM {table_schema}.{table} WHERE {i} IS NULL GROUP BY {i}"
            check_enums = con.execute(query).fetchall()
            logger.info(f"\n\nVIEW N NULLS FOR REQUIRED FIELD: '{table}' '{i}':")
            for col in format_rows(check_enums):
                logger.info(col)  

        participant_cols=['outcomesVitalStatus']

        for i in participant_cols:
            query = f"SELECT COUNT({i}) FROM {table_schema}.{table} WHERE {i} IS NULL GROUP BY {i}"
            check_enums = con.execute(query).fetchall()
            logger.info(f"\n\nVIEW N NULLS FOR NOT REQUIRED FIELD: '{table}' '{i}':")
            for col in format_rows(check_enums):
                logger.info(col)  