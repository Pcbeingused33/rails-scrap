import csv

# with open('test.csv', 'w') as new_file:
#     csv_writer = csv.writer(new_file)

#     for row in csv_writer:
#         csv_writer.writerow(["aaa"])

# with open('url_strings.csv', 'r') as csv_file:
#     csv_reader = csv.reader(csv_file)

#     for line in csv_reader:
#         url = line[1]

# with open('test.csv', mode='w') as employee_file:
#     employee_writer = csv.writer(employee_file)

#     for line in employee_writer:
#         employee_writer.writerow(["aaa"])
#         employee_writer.writerow(["bb"])
#         employee_writer.writerow(["cc"])

with open('test.csv', mode='w') as employee_file:
    employee_writer = csv.writer(employee_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

    employee_writer.writerow(['John Smith', 'Accounting', 'November'])
    employee_writer.writerow(['Erica Meyers', 'IT', 'March'])
