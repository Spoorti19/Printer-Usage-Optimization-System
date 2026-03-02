import streamlit as st
import pandas as pd
import pickle

# --- Load model ---
@st.cache_resource
def load_model():
    with open("models/ml_models/printer_load_forecasting.pkl", "rb") as f:
        return pickle.load(f)

clf = load_model()

# --- Known printer IDs (from model training) ---
printer_ids = ['PRN001', 'PRN002', 'PRN003']  # Update based on your actual trained data
printer_cols = [f'printer_{pid}' for pid in printer_ids]

# --- UI ---
st.title("Printer Busy Hour Forecast")
printer_id = st.text_input("Enter Printer ID", value="P001").strip()

if printer_id not in printer_ids:
    st.warning(f"Printer ID '{printer_id}' not recognized. Known IDs: {printer_ids}")
else:
    # --- Generate data for all hours ---
    hourly_data = []
    for hour in range(24):
        row = {col: 1 if col == f'printer_{printer_id}' else 0 for col in printer_cols}
        row['hour'] = hour
        hourly_data.append(row)

    input_df = pd.DataFrame(hourly_data)
    input_df = input_df[printer_cols + ['hour']]  # ensure column order

    # --- Predict busy probability for each hour ---
    probabilities = clf.predict_proba(input_df)[:, 1]

    # --- Build and show plot ---
    result_df = pd.DataFrame({
        'Hour': range(24),
        'Busy Probability': probabilities
    })

    st.line_chart(result_df.set_index('Hour'))

    st.success(f"Busy probability forecast generated for printer {printer_id}")
