import csv

def generate_case_statements(csv_file_path):
    # Initialize a dictionary to store case statements grouped by target field
    case_statements = {}

    # Open and read the CSV file
    with open(csv_file_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        
        for row in reader:
            # Skip rows not in use
            if row['in_use'] != 'T':
                continue
            
            # Extract relevant data from the row
            src_table = row['src_table']
            src_field = row['src_field']
            expected_src_value = row['expected_src_value']
            equivalent_model_value = row['equivalent_model_value']
            tgt_field = row['tgt_field']
            
            # Initialize the case statement for a target field if not already done
            if tgt_field not in case_statements:
                case_statements[tgt_field] = []
            
            # Add `WHEN` clauses to the case statement
            if expected_src_value and expected_src_value != 'else':
                case_statements[tgt_field].append(
                    f"    when  {src_table}.{src_field} = {expected_src_value}")
                case_statements[tgt_field].append(
                        f"      then {equivalent_model_value}")
            elif expected_src_value == 'else':
                # Handle the ELSE clause for `else`
                case_statements[tgt_field].append(
                    f"    else {equivalent_model_value}"
                )
    
    # Generate the final SQL case statements
    sql_statements = []
    for tgt_field, conditions in case_statements.items():
        # Combine all `WHEN` clauses and the `ELSE` clause into a single case statement
        case_statement = f"    case\n" + "\n".join(conditions) + f"\nend as \"{tgt_field}\","
        sql_statements.append(case_statement)
    
    # Print or return the SQL case statements
    return "\n\n".join(sql_statements)

# Example usage
csv_file_path = 'data/static/enumerations/aadsc_enums.csv' 
sql_output = generate_case_statements(csv_file_path)
print(sql_output)
