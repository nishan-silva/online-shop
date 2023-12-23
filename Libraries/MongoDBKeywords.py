from robot.api.deco import keyword
from pymongo import MongoClient, errors

class MongoDBKeywords:
    def __init__(self):
        self.client = None

    @keyword
    def connect_to_mongodb(self, uri):
        try:
            self.client = MongoClient(uri)
            self.client.admin.command('ping')  # Test the connection
            print("Connected to MongoDB!")
        except errors.ConnectionFailure as e:
            print(f"Connection error: {e}")

    @keyword
    def execute_mongodb_query(self, database_name, collection_name, query):
        try:
            db = self.client[database_name]
            collection = db[collection_name]
            query_result = list(collection.find(query))  # Ensure 'query' is of type dict
            return query_result
        except Exception as e:
            print(f"Error executing query: {e}")
            return None

    @keyword
    def disconnect_from_mongodb(self):
        if self.client:
            self.client.close()
            print("Disconnected from MongoDB")
