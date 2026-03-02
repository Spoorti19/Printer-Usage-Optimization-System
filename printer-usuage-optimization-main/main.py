import streamlit as st
import pandas as pd
import numpy as np

pages = {
    "Main":[st.Page("home.py", title="🏠Home")],
    "Data":[st.Page("data_view.py",title= "🔍Data View")],
    "AI Model":[st.Page("generate_recommendations_gui.py",title= "📝Generate Recommendations"),
                st.Page("view_recomend.py",title= "📜View Recommendations")],
    "Model Training":[st.Page("models/predictionmodel.py",title= "🛠️Model Training")],
}

pg = st.navigation(pages)
pg.run()