from models.ask_llama import query_llama  # your existing function
import os
from tqdm import tqdm  # For progress bar
import json
import streamlit as st  # For Streamlit integration
import time
import json
import re

def create_printer_recommendations_json(txt_path="printer_recommendations.txt", json_path="printer_recommendations.json"):
    with open(txt_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Split by printer blocks
    blocks = re.split(r"=== PRINTER: (PRN\d{3}) ===", content)
    recommendations = []
    for i in range(1, len(blocks), 2):
        printer_id = blocks[i].strip()
        details = blocks[i+1].strip().splitlines()
        # Parse details
        rec = {"printer_id": printer_id}
        for line in details:
            if line.startswith("- Status Recommendation:"):
                rec["status_recommendation"] = line.split(":", 1)[1].strip()
            elif line.startswith("- Maintenance Suggestion:"):
                rec["maintenance_suggestion"] = line.split(":", 1)[1].strip()
            elif line.startswith("- Optimization Tip:"):
                rec["optimization_tip"] = line.split(":", 1)[1].strip()
        recommendations.append(rec)

    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(recommendations, f, indent=4)

def split_printer_blocks(filename):
    with open(filename, "r") as f:
        content = f.read()

    return content.strip().split("=== PRINTER:")

def generate_recommendations():  # Add import for timing
    start_time = time.time()  # Start timer
    with open("printer_summary.json", "r") as f:
        printer_data = json.load(f)

    recommendations = {}  # Dictionary to store recommendations

    with st.status("Processing data... :red[**DO NOT CHANGE THE TAB!**]",expanded=True) as status:
        my_bar = st.progress(0, text="Processing printer data...")
        total_printers = len(printer_data)
        progress = 1/total_printers
        x = 0
        for printer in printer_data:
            printer_id = printer["printer_id"]
            my_bar.progress(x, text=f"Processing printer {printer_id}...")
            prompt = f"""
You are an assistant helping optimize printer usage and maintenance.

Below is data for printer {printer_id}:
{json.dumps(printer, indent=4)}

Do NOT repeat the input data in your response.

Give recommendations in this exact format:
- Status Recommendation: [Keep / Replace / Move]
- Maintenance Suggestion: [a brief sentence explaining the maintenance insight]
- Optimization Tip: [One short actionable tip]

Be concise. No extra text. Avoid repeating information. Read the data carefully and provide the best recommendation based on the data.
"""

            answer = query_llama(prompt)
            recommendations[printer_id] = answer  # Store in dictionary
            x += progress

    with open("printer_recommendations.txt", "w") as out:
        for printer_id, recommendation in recommendations.items():
            out.write(f"=== PRINTER: {printer_id} ===\n")
            out.write(recommendation + "\n\n")
    status.update(
        label="Recommendations generated successfully!", state="complete", expanded=False
    )
    create_printer_recommendations_json()
    end_time = time.time()  # End timer
    elapsed = end_time - start_time
    st.write(f"Time taken: {elapsed:.2f} seconds")  # Display elapsed time

if __name__ == "__main__":
    generate_recommendations()
