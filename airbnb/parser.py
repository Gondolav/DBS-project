import csv

with open('berlin_reviews.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    with open('berlin_reviews_clean.csv', 'w', newline='') as output:
        writer = csv.writer(output, delimiter=' ',
                                quotechar='|', quoting=csv.QUOTE_MINIMAL)
        for row in reader:
            writer.writerow([r.strip() for r in row])
