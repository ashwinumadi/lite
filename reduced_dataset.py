import json
import os

os.rename('./data/processed_data/test_processed.json','./data/processed_data/test_processed2.json' )


# Path to the original file and the new file
input_file = './data/processed_data/test_processed2.json'
output_file = './data/processed_data/test_processed.json'



# Read the original file and get the first 5 lines
with open(input_file, 'r') as infile:
    lines = infile.readlines()  # Read all lines from the original file
    trimmed_lines = lines[:1999]   # Take the first 5 lines

# Write the first 5 lines to a new file
with open(output_file, 'w') as outfile:
    outfile.writelines(trimmed_lines)

print(f"Trimmed file written to {output_file}")