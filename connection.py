import psycopg2

# Connect to testdb
conn = psycopg2.connect(
    dbname="TestDB",
    user="postgres",
    password="Aditya@15425",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

# Import CSV
csv_file_path = "./data/country_wise_latest.csv"
with open(csv_file_path, 'r') as f:
    cursor.copy_expert("COPY covid_stat FROM STDIN WITH CSV HEADER", f)

conn.commit()
cursor.close()
conn.close()

print("CSV data imported successfully!")