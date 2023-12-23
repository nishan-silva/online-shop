*** Settings ***
Library    ../Libraries/MongoDBKeywords.py

*** Variables ***
${MONGODB URI}    mongodb+srv://nishaansilva:admin@cluster0.ydj5go5.mongodb.net/?retryWrites=true&w=majority
${DATABASE NAME}        sample_analytics
${COLLECTION NAME}        transactions
${QUERY}              {"transaction_count": {"$gt": 66}}  # Example query: Fetch documents where 'transaction_count' is greater than 66

*** Test Cases ***
Connect to MongoDB and Execute Query
    Connect To MongoDB    ${MONGODB URI}
    Log To Console        DB login success
    ${queryresult}=       Execute MongoDB Query    ${DATABASE NAME}    ${COLLECTION NAME}    ${QUERY}
    Log To Console        Query Results: ${queryresult}
    Disconnect From MongoDB

