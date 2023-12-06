*** Settings ***
Documentation   Test Product API of the backend
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary
Library         Random
Resource        ../KeywordLibraries/CommonKeywords.robot  
Variables       ../TestData/TestData.py

*** Variables ***
${URL}=      ${ENV_BACKEND_PROTOCOL}://${ENV_BACKEND_HOST}
${TIMEOUT}=    5

*** Test Cases ***
POST /api/createAccount
    Create Session    mysession    ${URL}
    ${user_registration_success}=    Get Variable Value    ${USER_REGISTRATION_SUCCESS}
    ${body}=    Evaluate    $user_registration_success    # Directly use the retrieved value
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST    ${URL}/api/createAccount    data=${body}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${json_object}=    Evaluate    json.loads($response.content)    json

    #Status code validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    #Single data validation
    ${response_code}=    Get From Dictionary    ${json_object}    responseCode
    ${create_account_message}=    Get From Dictionary    ${json_object}    message
    Log To Console    ${response_code}
    Log To Console    ${create_account_message}
    Should Be Equal As Strings    ${response_code}    201
    Should Be Equal As Strings    ${create_account_message}    User created!

PUT /api/updateAccount
     Create Session    mysession    ${URL}
     ${update_user_details}=    Get Variable Value    ${UPDATE_USER_DETAILS}
     ${body}=    Evaluate    $update_user_details    # Directly use the retrieved value   
     ${header}=    Create Dictionary    Content-Type=application/json
     ${response}=    PUT    ${URL}/api/updateAccount    data=${body}
     Log To Console    ${response.status_code}
     Log To Console    ${response.content}
     Log To Console    ${response.headers}
     ${json_object}=    Evaluate    json.loads($response.content)    json

    #Status code validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    # Multiple data validation
    ${response_code}=    Get From Dictionary    ${json_object}    responseCode
    ${user_updated_message}=    Get From Dictionary    ${json_object}    message
    Log To Console    ${response_code}
    Log To Console    ${user_updated_message}
    Should Be Equal As Strings    ${response_code}    200
    Should Be Equal As Strings    ${user_updated_message}    User updated!

GET /api/productsList
    Create Session    mysession    ${URL}
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET    ${URL}/api/productsList
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${json_object}=    Evaluate    json.loads($response.content)    json

    #Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

#StoreCategoriesAndUseInNextRequest
    @{categories}=    Create List

    FOR    ${product}    IN    @{json_object["products"]}
        ${category}=    Get From Dictionary    ${product}    category
        ${category_name}=    Get From Dictionary    ${category}    category
        Append To List    ${categories}    ${category_name}
    END

    Log To Console    ${categories}    # Displays all category names in the log

    # Use ${categories} in subsequent requests or actions
    # For example:
    # ${first_category}=    Get From List    ${categories}    0
    # Log    First Category: ${first_category}

 POST /api/Search Product   
     Create Session    mysession    ${URL}
     ${body}=    Create Dictionary     search_product=tops
     ${header}=    Create Dictionary    Content-Type=application/json
     ${response}=    POST    ${URL}/api/searchProduct    data=${body}
     Log To Console    ${response.status_code}
     Log To Console    ${response.content}
     Log To Console    ${response.headers}

    #Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

GET /api/getUserDetailByEmail
    Create Session    mysession    ${URL}
    ${email}=    Get Variable Value    ${EMAIL}
    ${params}=    Create Dictionary    email=${email}
    ${response}=    GET    url=${URL}/api/getUserDetailByEmail    params=${params}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

DELETE /api/deleteAccount
     Create Session    mysession    ${URL}
     ${delete_user}=    Get Variable Value    ${DELETE_USER}
     ${body}=    Evaluate    $delete_user    # Directly use the retrieved value   
     ${header}=    Create Dictionary    Content-Type=application/json
     ${response}=    DELETE    ${URL}/api/deleteAccount    data=${body}
     Log To Console    ${response.status_code}
     Log To Console    ${response.content}
     Log To Console    ${response.headers}

    #Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200