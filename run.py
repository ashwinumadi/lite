# Function to split the text file into 3 parts

def split_file(file_path):
    # Read the contents of the file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Calculate the number of lines for each file
    total_lines = len(lines)
    lines_per_file = total_lines // 5

    # Split the lines into three parts
    part1 = lines[:lines_per_file]
    part2 = lines[lines_per_file:2*lines_per_file]
    part3 = lines[2*lines_per_file:3*lines_per_file]
    part4 = lines[3*lines_per_file:4*lines_per_file]
    part5 = lines[4*lines_per_file:]

    # Write each part into a separate file
    with open('./data/processed_data/test_processed1.json', 'w') as outfile1:
        outfile1.writelines(part1)

    with open('./data/processed_data/test_processed2.json', 'w') as outfile2:
        outfile2.writelines(part2)

    with open('./data/processed_data/test_processed3.json', 'w') as outfile3:
        outfile3.writelines(part3)
    
    with open('./data/processed_data/test_processed4.json', 'w') as outfile3:
        outfile3.writelines(part4)
    
    with open('./data/processed_data/test_processed5.json', 'w') as outfile3:
        outfile3.writelines(part5)

    print("Files created successfully.")

# Usage
split_file('./data/processed_data/test_processed.json')
