# MongoDB Database and Document Filtering

A project to create and query a MongoDB database with document filters.

## Features
- Creates a `userDB` database and `profiles` collection.
- Inserts documents with `name`, `age`, and `city` fields.
- Queries documents using `find()` with filters (e.g., by age, city).

## Files
- `mongo_profiles.py`: Python script for database operations.
- `test_mongo_profiles.sh`: Bash script to test functionality.

## Setup
1. Install MongoDB: `sudo apt install mongodb`.
2. Start MongoDB: `sudo systemctl start mongodb`.
3. Install Python and pymongo: `pip install pymongo`.
4. Run the script: `python3 mongo_profiles.py`.
5. Run tests: `bash test_mongo_profiles.sh`.

