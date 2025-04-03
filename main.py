import os
import pandas as pd

# Ensure your kaggle.json is in the right place
os.environ['KAGGLE_CONFIG_DIR'] = os.path.expanduser(r'C:\Users\Aditya\.kaggle')

# Define dataset name and path where to save it
dataset = "imdevskp/corona-virus-report"  # Replace this with your dataset's URL slug
download_path = "./data"

# Create data directory if it doesn't exist
os.makedirs(download_path, exist_ok=True)

# Download dataset using Kaggle API
os.system(f'kaggle datasets download -d {dataset} -p {download_path} --unzip')

# List files in the downloaded directory
files = os.listdir(download_path)
print("Downloaded files:", files)


