*** Settings ***
Library    ../Libraries/MongoDBKeywords.py

*** Variables ***
${MONGODB URI}    mongodb+srv://nishaansilva:admin@cluster0.ydj5go5.mongodb.net/?retryWrites=true&w=majority

*** Test Cases ***
Connect to MongoDB
    Connect To MongoDB    ${MONGODB URI}
    # Perform operations or assertions
    Disconnect From MongoDB
