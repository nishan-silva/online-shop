*** Settings ***
Library    ../Libraries/MongoDBKeywords.py

*** Variables ***
${MONGODB URI}        mongodb+srv://nishaansilva:admin@cluster0.ydj5go5.mongodb.net/?retryWrites=true&w=majority
${DATABASE NAME}      sample_analytics
${COLLECTION NAME}    transactions

*** Test Cases ***
Connect to MongoDB and Execute Query
    Connect To MongoDB    ${MONGODB URI}
    Log To Console        DB login success
    ${query}=    Evaluate    {'transaction_count': {'$gt': 66}}  # Providing the query directly
    ${queryresult}=       Execute MongoDB Query    ${DATABASE NAME}    ${COLLECTION NAME}    ${query}
    Log To Console        Query Results: ${queryresult}
    Disconnect From MongoDB
