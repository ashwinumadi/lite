import json

# Load the JSON data from the file
with open('./data/processed_data/test_processed.json', 'r') as json_file:
    data = json.load(json_file)

# Calculate how many lines each file should have
total_lines = len(data)
lines_per_file = total_lines // 3

# Split the data into three parts
part1 = data[:lines_per_file]
part2 = data[lines_per_file:2*lines_per_file]
part3 = data[2*lines_per_file:]

# Save each part into separate files
with open('./data/processed_data/test_processed1.json', 'w') as outfile1:
    json.dump(part1, outfile1, indent=4)

with open('./data/processed_data/test_processed2.json', 'w') as outfile2:
    json.dump(part2, outfile2, indent=4)

with open('./data/processed_data/test_processed3.json', 'w') as outfile3:
    json.dump(part3, outfile3, indent=4)

print("Files created successfully.")
