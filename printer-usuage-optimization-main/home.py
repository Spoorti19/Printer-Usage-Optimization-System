import streamlit as st
import webbrowser
import os

# Set the title of the app
st.title("Printer Usage Optimization")

# Add content to the home page
st.header("Welcome to the Home Page")
st.write("This is the main page of the application.")

# Add a button to open the local Power BI file in the workspace
if st.button("Open Power BI Dashboard"):
    os.system('start "" "dashboard.pbix"')

# Optionally, to open a local web app, use:
# if st.button("Open Local Web App"):
#     webbrowser.open("http://localhost:8501")
