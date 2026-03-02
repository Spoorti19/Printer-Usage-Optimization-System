import mysql.connector

class DB():
    def __init__(self):
        """
        Initializes the database connection.
        """
        self.connection = mysql.connector.connect(
            host="localhost",
            user="tejas",
            password="tejas",
            database="printer_management"
        )
        self.cursor = self.connection.cursor(dictionary=True)
        
    def get_tables(self):
        """
        Retrieves the list of tables in the database.

        Returns:
            list: A list of table names in the database.
        """
        self.cursor.execute("SHOW TABLES")
        tables = [table['Tables_in_printer_management'] for table in self.cursor.fetchall()]
        return tables
    
    def get_printer_ids(self):
        """
        Retrieves the list of printer IDs from the printers table.

        Returns:
            list: A list of printer IDs.
        """
        self.cursor.execute("SELECT printer_id FROM printers")
        printer_ids = [row['printer_id'] for row in self.cursor.fetchall()]
        return printer_ids
    

