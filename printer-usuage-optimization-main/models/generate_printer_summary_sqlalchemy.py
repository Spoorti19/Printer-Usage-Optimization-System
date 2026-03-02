import mysql.connector
import json
import decimal

DB_CONFIG = {
    "host": "localhost",
    "user": "tejas",
    "password": "tejas",
    "database": "printer_management"
}

def decimal_default(obj):
    if isinstance(obj, decimal.Decimal):
        return float(obj)
    raise TypeError(f"Object of type {obj.__class__.__name__} is not JSON serializable")

def get_printer_summaries():
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor(dictionary=True)

    # Fetch printer summary data
    cursor.execute("""
        SELECT 
            p.printer_id,
            p.model,
            p.location,
            p.installation_date,
            p.status,
            p.total_page_count,
            MAX(m.maintenance_date) AS last_maintenance,
            COUNT(m.record_id) AS maintenance_count,
            SUM(m.cost) AS total_maintenance_cost,
            AVG(DATEDIFF(NOW(), m.maintenance_date)) AS avg_days_since_maintenance
        FROM Printers p
        LEFT JOIN maintenance_records m ON p.printer_id = m.printer_id
        GROUP BY p.printer_id
    """)
    printer_data = cursor.fetchall()

    # Fetch maintenance descriptions
    cursor.execute("""
        SELECT 
            printer_id,
            maintenance_date,
            description
        FROM maintenance_records
        ORDER BY printer_id, maintenance_date DESC
    """)
    printer_descriptions = cursor.fetchall()

    # Map descriptions to printers
    description_map = {}
    for record in printer_descriptions:
        description_map.setdefault(record["printer_id"], []).append(
            {"date": str(record["maintenance_date"]), "description": record["description"]}
        )

    printer_summary = []
    for p in printer_data:
        printer_summary.append({
            "printer_id": p["printer_id"],
            "model": p["model"],
            "location": p["location"],
            "installation_date": str(p["installation_date"]),
            "status": p["status"],
            "total_page_count": p["total_page_count"],
            "last_maintenance": str(p["last_maintenance"]),
            "maintenance_count": p["maintenance_count"],
            "total_maintenance_cost": p["total_maintenance_cost"],
            "avg_days_since_maintenance": p["avg_days_since_maintenance"],
            "maintenance_descriptions": description_map.get(p["printer_id"], [])
        })

    with open("printer_summary.json", "w") as f:
        json.dump(printer_summary, f, indent=4, default=decimal_default)

    print("✅ Printer summary saved to 'printer_summary.json'")

    cursor.close()
    conn.close()

if __name__ == "__main__":
    get_printer_summaries()
