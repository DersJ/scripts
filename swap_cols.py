import csv

def swap_columns(input_file, output_file):
    with open(input_file, mode='r', newline='') as infile:
        reader = csv.reader(infile)
        rows = list(reader)
        
        # Check if there are at least two columns to swap
        if len(rows[0]) < 2:
            print("The input file does not have enough columns to swap.")
            return
        
        # Swap the first two columns for each row
        for row in rows:
            row[0], row[1] = row[1], row[0]
    
    with open(output_file, mode='w', newline='') as outfile:
        writer = csv.writer(outfile)
        writer.writerows(rows)

