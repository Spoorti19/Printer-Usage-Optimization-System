import pandas as pd
from datetime import datetime

# Load training data
train_data = pd.read_csv("printers1.csv")

# Standardize column name
train_data.rename(columns={'last_maintainance': 'last_maintenance'}, inplace=True)

# Convert date columns
train_data['installation_date'] = pd.to_datetime(train_data['installation_date'], errors='coerce')
train_data['last_maintenance'] = pd.to_datetime(train_data['last_maintenance'], errors='coerce')

# Normalize status text
train_data['status'] = train_data['status'].str.strip().str.lower()

# Today's date
today = pd.to_datetime(datetime.now())

# Calculate printer age and days since last maintenance
train_data['printer_age'] = (today - train_data['installation_date']).dt.days
train_data['days_since_maintenance'] = (today - train_data['last_maintenance']).dt.days

# Replacement condition function
def needs_replacement(row):
    return int(
        row['printer_age'] > (365 * 2.5) or                         # Over 2.5 years
        row['status'] == 'maintenance' or                           # In maintenance
        (row['days_since_maintenance'] < 30 and row['status'] != 'active')  # Recently maintained but not active
    )

# Apply logic
train_data['predicted_replacement'] = train_data.apply(needs_replacement, axis=1)
train_data['predicted_replacement'] = train_data['predicted_replacement'].map({1: 'Yes', 0: 'No'})

# Select columns to show
output = train_data[['printer_id', 'printer_age', 'days_since_maintenance', 'total_page_count', 'status', 'predicted_replacement']]

# Print result
print("\nAll Printers with Replacement Prediction (Simple Logic-Based):")
print(output.to_string(index=False))
