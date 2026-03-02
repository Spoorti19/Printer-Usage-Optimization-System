import streamlit as st
import pandas as pd
from models.dmodels import DB

def fetch_table_data(db, table_name):
    """
    Fetches all data from the specified table.

    Args:
        db (DB): An instance of the DB class.
        table_name (str): The name of the table.

    Returns:
        pd.DataFrame: DataFrame containing the table data.
    """
    db.cursor.execute(f"SELECT * FROM `{table_name}`")
    rows = db.cursor.fetchall()
    if rows:
        return pd.DataFrame(rows)
    else:
        return pd.DataFrame()

# Streamlit app
st.title("Database Table Viewer")

db = DB()
table_list = db.get_tables()

if table_list:
    selected_table = st.selectbox("Select a table to view its data:", table_list)

    if selected_table:
        table_data = fetch_table_data(db, selected_table)
        if not table_data.empty:
            st.write(f"Data from table: {selected_table}")
            st.dataframe(table_data)
        else:
                st.write(f"No data found in table: {selected_table}")
else:
    st.write("No tables found in the database.")
