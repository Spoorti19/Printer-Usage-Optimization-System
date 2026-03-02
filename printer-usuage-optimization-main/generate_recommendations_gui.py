import streamlit as st

from models.generate_recommendations import generate_recommendations
from models.generate_printer_summary_sqlalchemy import get_printer_summaries


def generate_recommendation():

    get_printer_summaries()
    generate_recommendations()
    st.success("Recommendations generated successfully!")

# Streamlit page setup
st.title("Generate Printer Recommendations")
st.write("Click the button below to generate printer recommendations.")

# Button to trigger recommendation generation
if st.button("Generate Recommendations"):
    
    generate_recommendation()