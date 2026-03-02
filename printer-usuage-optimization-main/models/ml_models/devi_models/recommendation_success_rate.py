import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.neighbors import KNeighborsClassifier

# Load dataset
df = pd.read_csv("optimization.csv")

# Drop missing data
df.dropna(subset=['printer_id', 'recommendation_type', 'potential_savings', 'initial_expense', 'final_cost', 'implemented'], inplace=True)

# Label encode categorical fields
le_rec = LabelEncoder()
df['recommendation_code'] = le_rec.fit_transform(df['recommendation_type'])

le_printer = LabelEncoder()
df['printer_code'] = le_printer.fit_transform(df['printer_id'])

# Features and target
X = df[['printer_code', 'recommendation_code', 'potential_savings', 'initial_expense', 'final_cost']]
y = df['implemented'].astype(int)

# Normalize features
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Train-test split (optional)
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

# Train KNN model
model = KNeighborsClassifier(n_neighbors=5)  # You can adjust n_neighbors
model.fit(X_train, y_train)

# ----------- 💡 User Input Section -----------
# Take user input
user_printer_id = input("Enter Printer ID: ")
user_recommendation = input("Enter Recommendation Type: ")

# Check if valid input exists in the data
if user_printer_id not in le_printer.classes_:
    print("Printer ID not found in training data.")
elif user_recommendation not in le_rec.classes_:
    print("Recommendation Type not found in training data.")
else:
    # Encode input
    printer_code = le_printer.transform([user_printer_id])[0]
    recommendation_code = le_rec.transform([user_recommendation])[0]

    # Estimate or fetch financial features
    filtered = df[(df['printer_code'] == printer_code) & (df['recommendation_code'] == recommendation_code)]
    if filtered.empty:
        print("No past data for this combination. Using global averages.")
        potential_savings = df['potential_savings'].mean()
        initial_expense = df['initial_expense'].mean()
        final_cost = df['final_cost'].mean()
    else:
        potential_savings = filtered['potential_savings'].mean()
        initial_expense = filtered['initial_expense'].mean()
        final_cost = filtered['final_cost'].mean()

    # Prepare input
    user_features = [[printer_code, recommendation_code, potential_savings, initial_expense, final_cost]]
    user_features_scaled = scaler.transform(user_features)

    # Prediction
    prediction = model.predict(user_features_scaled)[0]
    probability = model.predict_proba(user_features_scaled)[0][1]

    if prediction == 1:
        print(f"The recommendation is likely to be implemented. (Confidence: {probability:.2f})")
    else:
        print(f"The recommendation is likely NOT to be implemented. (Confidence: {1 - probability:.2f})")
