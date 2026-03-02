import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import pickle

def load_and_preprocess(csv_path):
    df = pd.read_csv(csv_path)
    df['print_time'] = pd.to_datetime(df['print_time'])
    df['hour'] = df['print_time'].dt.hour
    usage = df.groupby(['printer_id', 'hour']).size().reset_index(name='no_of_jobs')
    def label_busy(df_group):
        median = df_group['no_of_jobs'].median()
        df_group['busy'] = (df_group['no_of_jobs'] > median).astype(int)
        return df_group
    usage = usage.groupby('printer_id').apply(label_busy).reset_index(drop=True)
    return df, usage

def train_model(usage):
    usage_encoded = pd.get_dummies(usage[['printer_id']], prefix='printer')
    X = pd.concat([usage_encoded, usage['hour']], axis=1)
    y = usage['busy']
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    clf = RandomForestClassifier(n_estimators=100, random_state=42)
    clf.fit(X_train, y_train)
    y_pred = clf.predict(X_test)
    print(f"Test Accuracy: {accuracy_score(y_test, y_pred):.2f}")
    return clf, X, X_train, X_test, y_train, y_test

def predict_busiest_hours(clf, X, usage, input_printer_id):
    printer_cols = [col for col in X.columns if col.startswith("printer_")]
    input_data = pd.DataFrame({'hour': list(range(24))})
    for col in printer_cols:
        input_data[col] = 1 if col == f'printer_{input_printer_id}' else 0
    input_data = input_data[X.columns]
    probs = clf.predict_proba(input_data)[:, 1]
    input_data['busy_prob'] = probs
    input_data['hour'] = list(range(24))
    input_data['formatted'] = input_data['hour'].apply(
        lambda h: pd.to_datetime(f"{h}:00", format="%H:%M").strftime("%I %p")
    )
    ref_jobs = usage[usage['printer_id'] == input_printer_id][['hour', 'no_of_jobs']]
    merged = input_data.merge(ref_jobs, on='hour', how='left').fillna({'no_of_jobs': 0})
    top_hours = merged.sort_values(['busy_prob', 'no_of_jobs'], ascending=False).head(3)
    print(f"\nTop 3 Busiest Times (Predicted) for Printer '{input_printer_id}':")
    for t in top_hours['formatted']:
        print(f"{t}")

def main():
    df, usage = load_and_preprocess("devi_models/printer_jobs1.csv")
    clf, X, X_train, X_test, y_train, y_test = train_model(usage)
    input_printer_id = input("Enter the Printer ID: ").strip()
    if input_printer_id not in usage['printer_id'].unique():
        print("Printer ID not found in the dataset.")
        print("Available Printer IDs:", ', '.join(map(str, usage['printer_id'].unique())))
        return
    predict_busiest_hours(clf, X, usage, input_printer_id)
    print(f"\nOriginal print jobs: {len(df)}")
    print(f"ML training rows (after grouping): {len(usage)}")
    print(f"Used for training: {len(X_train)} rows")
    print(f"Used for testing: {len(X_test)} rows")
    print(f"Unique printers: {df['printer_id'].nunique()}")
    with open("printer_load_forecasting.pkl", "wb") as f:
        pickle.dump(clf, f)
    print("✅ Model saved as printer_load_forecasting.pkl!")

if __name__ == "__main__":
    main()
