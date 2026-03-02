import streamlit as st
import json

def load_recommendations_json(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        data = json.load(f)
    # Create a dict with printer_id as key and details as value,
    nested_dict = {item['printer_id']: item for item in data}
   
    return nested_dict

recommendations = load_recommendations_json("printer_recommendations.json")

st.title("Printer Recommendations Viewer")

printer_ids = sorted(recommendations.keys())
selected_printer = st.selectbox("Select Printer ID", printer_ids)

if selected_printer:
    st.subheader(f"Recommendations for {selected_printer}")
    if recommendations[selected_printer]['status_recommendation'] == 'Keep':
        st.write("Status Recommendation:  :green-badge[:material/check: Keep]")
    elif recommendations[selected_printer]['status_recommendation'] == 'Replace':
        st.write("Status Recommendation:  :red-badge[:material/change_circle: Replace]")
    st.write("**Maintenance Suggestion**: ", recommendations[selected_printer]['maintenance_suggestion'])
    st.write("**Optimization Recomendation**:", recommendations[selected_printer]['optimization_tip'])