import csv


def read_csv_file(filename):
    data = []

    with open('TestDataCSV.csv', 'r+b') as csvfile:

        reader = csv.DictReader(csvfile)

    for row in reader:
        data.append(row)
    return data


class csvLibraryNoOfRows(object):
    pass
