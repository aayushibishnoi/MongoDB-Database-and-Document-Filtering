import pymongo
from pymongo import MongoClient

def setup_database():
    # Connect to MongoDB (default: localhost:27017)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Create or access userDB database
    db = client['userDB']
    
    # Create or access profiles collection
    collection = db['profiles']
    
    # Clear existing documents (for clean testing)
    collection.delete_many({})
    
    return db, collection

def insert_documents(collection):
    # Sample documents
    profiles = [
        {"name": "Alice Smith", "age": 25, "city": "New York"},
        {"name": "Bob Johnson", "age": 30, "city": "San Francisco"},
        {"name": "Charlie Brown", "age": 25, "city": "Chicago"},
        {"name": "Diana Lee", "age": 35, "city": "New York"},
        {"name": "Emma Wilson", "age": 28, "city": "San Francisco"}
    ]
    
    # Insert documents
    result = collection.insert_many(profiles)
    print(f"Inserted {len(result.inserted_ids)} documents")

def query_documents(collection):
    print("\n=== Query Results ===")
    
    # Query 1: Find users with age 25
    print("Users aged 25:")
    for doc in collection.find({"age": 25}):
        print(doc)
    
    # Query 2: Find users in San Francisco
    print("\nUsers in San Francisco:")
    for doc in collection.find({"city": "San Francisco"}):
        print(doc)
    
    # Query 3: Find users aged > 25 in New York
    print("\nUsers over 25 in New York:")
    for doc in collection.find({"age": {"$gt": 25}, "city": "New York"}):
        print(doc)

def main():
    # Setup database and collection
    db, collection = setup_database()
    
    # Insert sample documents
    insert_documents(collection)
    
    # Perform queries
    query_documents(collection)

if __name__ == "__main__":
    main()
