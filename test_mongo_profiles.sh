#!/bin/bash

# Test script for MongoDB Database and Document Filtering

# Check if Python is installed
echo "Checking for Python3..."
if ! command -v python3 >/dev/null 2>&1; then
    echo "FAIL: Python3 not found. Install it with 'sudo apt install python3'."
    exit 1
fi
echo "PASS: Python3 found"

# Check if pymongo is installed
echo "Checking for pymongo..."
if ! python3 -c "import pymongo" 2>/dev/null; then
    echo "FAIL: pymongo not found. Install it with 'pip install pymongo'."
    exit 1
fi
echo "PASS: pymongo found"

# Check if MongoDB is running
echo "Checking for MongoDB..."
if ! mongod --version >/dev/null 2>&1; then
    echo "FAIL: MongoDB not found or not running. Install and start it."
    exit 1
fi
echo "PASS: MongoDB found"

# Run the Python script and capture output
echo "Running mongo_profiles.py..."
python3 mongo_profiles.py > output.txt

# Test 1: Check document insertion
echo "Testing document insertion..."
if grep -q "Inserted 5 documents" output.txt; then
    echo "PASS: 5 documents inserted"
else
    echo "FAIL: Document insertion failed"
fi

# Test 2: Check query for age 25
echo "Testing query for age 25..."
if grep -q "Alice Smith" output.txt && grep -q "Charlie Brown" output.txt; then
    echo "PASS: Found users aged 25"
else
    echo "FAIL: Age 25 query failed"
fi

# Test 3: Check query for San Francisco
echo "Testing query for San Francisco..."
if grep -q "Bob Johnson" output.txt && grep -q "Emma Wilson" output.txt; then
    echo "PASS: Found users in San Francisco"
else
    echo "FAIL: San Francisco query failed"
fi

# Test 4: Check query for age > 25 in New York
echo "Testing query for age > 25 in New York..."
if grep -q "Diana Lee" output.txt; then
    echo "PASS: Found users over 25 in New York"
else
    echo "FAIL: Age > 25 in New York query failed"
fi

# Clean up
rm -f output.txt

echo "All tests completed!"
