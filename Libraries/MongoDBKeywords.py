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
    def disconnect_from_mongodb(self):
        if self.client:
            self.client.close()
            print("Disconnected from MongoDB")
