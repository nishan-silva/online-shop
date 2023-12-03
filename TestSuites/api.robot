*** Settings ***
Documentation   Test Product API of the backend
Library         RequestsLibrary
Library         Collections
Resource        ../KeywordLibraries/CommonKeywords.robot  
Variables       ../TestData/TestData.py

*** Variables ***
${URL}=      ${ENV_BACKEND_PROTOCOL}://${ENV_BACKEND_HOST}
${TIMEOUT}=    5

*** Test Cases  ***
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

    #Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

GET /api/getUserDetailByEmail
    Create Session    mysession    ${URL}
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET    ${URL}/api/getUserDetailByEmail?email=${EMAIL}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

GET /api/productsList
    Create Session    mysession    ${URL}
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET    ${URL}/api/productsList
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

PUT /api/updateAccount
     Create Session    mysession    ${URL}
     ${body}=    Create Dictionary     name=, email, password, title (for example: Mr, Mrs, Miss), birth_date, birth_month, birth_year, firstname, lastname, company, address1, address2, country, zipcode, state, city, mobile_number
     ${header}=    Create Dictionary    Content-Type=application/json
     ${response}=    POST    ${URL}/api/searchProduct    data=${body}
     Log To Console    ${response.status_code}
     Log To Console    ${response.content}
     Log To Console    ${response.headers}

 POST /api/Search Product   
     Create Session    mysession    ${URL}
     ${body}=    Create Dictionary     search_product=top
     ${header}=    Create Dictionary    Content-Type=application/json
     ${response}=    POST    ${URL}/api/searchProduct    data=${body}
     Log To Console    ${response.status_code}
     Log To Console    ${response.content}
     Log To Console    ${response.headers}
