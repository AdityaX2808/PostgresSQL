import os
import pandas as pd

# Load the CSV file into a DataFrame (replace 'train.csv' with the actual file name)
download_path = "./data"
csv_file = os.path.join(download_path, 'country_wise_latest.csv')
df = pd.read_csv(csv_file)

# Display first few rows of the DataFrame
print(df.head())
