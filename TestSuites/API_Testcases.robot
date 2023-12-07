*** Settings ***
Documentation       Test Product API of the backend

Library             RequestsLibrary
Library             Collections
Resource            ../KeywordLibraries/CommonKeywords.robot
Variables           ../TestData/TestData.py

*** Variables ***
${URL}=         ${ENV_BACKEND_PROTOCOL}://${ENV_BACKEND_HOST}
${TIMEOUT}=     5

*** Test Cases ***
POST /api/createAccount
    ${parsed_response}=    CommonKeywords.Calling API    POST    ${URL}/api/createAccount    200    data=${USER_REGISTRATION_SUCCESS}
    Response Logs    ${parsed_response.status_code}    ${parsed_response.content}

    #Validating Response Message
    CommonKeywords.Validating Response Message   ${parsed_response.content}    User created!

PUT /api/updateAccount
    ${parsed_response}=    CommonKeywords.Calling API    PUT    ${URL}/api/updateAccount    200    data=${UPDATE_USER_DETAILS}
    Response Logs    ${parsed_response.status_code}    ${parsed_response.content}

    #Validating Response Message
    CommonKeywords.Validating Response Message   ${parsed_response.content}    User updated!

GET /api/productsList
    ${parsed_response}=    CommonKeywords.Calling API    GET    ${URL}/api/productsList   200
    Response Logs    ${parsed_response.status_code}    ${parsed_response.content}

POST /api/Search Product
    ${parsed_response}=    CommonKeywords.Calling API    POST    ${URL}/api/searchProduct   200        data=${SEARCH_PRODUCT}
    Response Logs    ${parsed_response.status_code}    ${parsed_response.content}

GET /api/getUserDetailByEmail
    ${parsed_response}=    CommonKeywords.Calling API    GET    ${URL}/api/getUserDetailByEmail   200        params=email=${EMAIL}
    Response Logs    ${parsed_response.status_code}    ${parsed_response.content}
    
DELETE /api/deleteAccount
    ${parsed_response}=    CommonKeywords.Calling API    DELETE    ${URL}/api/deleteAccount   200        data=${DELETE_USER}
    Response Logs    ${parsed_response.status_code}    ${parsed_response.content}