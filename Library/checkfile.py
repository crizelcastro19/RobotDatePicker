import csv


def go_to_nth_row_nth_column(file, row_no, col_no):
    inputFile = file
    row_no = int(row_no)
    col_no = int(col_no)
    with open(inputFile) as ip:
        reader = csv.reader(ip)
        for i, row in enumerate(reader):
            if i == row_no:  # here's the row
                return row[col_no]


def search_cell(file, search_string):
    inputFile = file
    search_position = []

    with open(inputFile) as ip:
        reader = csv.reader(ip)
        for i, row in enumerate(reader):
            for j, column in enumerate(row):
                if search_string in column:
                    print(i, j)
                    search_position.append((i, j))
                    return (i, j)
    return search_position
