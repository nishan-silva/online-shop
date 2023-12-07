*** Settings ***
Documentation       Test Product API of the backend

Library             RequestsLibrary
Library             Collections
Resource            ../KeywordLibraries/BackendCommonKeywords.robot
Variables           ../TestData/Backend_TestData.py

*** Variables ***
${BACKEND_URL}=         ${ENV_BACKEND_PROTOCOL}://${ENV_BACKEND_HOST}
${TIMEOUT}=     5

*** Test Cases ***
POST /api/createAccount
    ${response}=    BackendCommonKeywords.Calling API    POST    ${BACKEND_URL}/api/createAccount    200    data=${USER_REGISTRATION_SUCCESS}
    Response Logs    ${response.status_code}    ${response.content}

    #Validating Response Message
    BackendCommonKeywords.Validating Response Message   ${response.content}    User created!

PUT /api/updateAccount
    ${response}=    BackendCommonKeywords.Calling API    PUT    ${BACKEND_URL}/api/updateAccount    200    data=${UPDATE_USER_DETAILS}
    Response Logs    ${response.status_code}    ${response.content}

    #Validating Response Message
    BackendCommonKeywords.Validating Response Message   ${response.content}    User updated!

GET /api/productsList
    ${response}=    BackendCommonKeywords.Calling API    GET    ${BACKEND_URL}/api/productsList   200
    Response Logs    ${response.status_code}    ${response.content}

POST /api/Search Product
    ${response}=    BackendCommonKeywords.Calling API    POST    ${BACKEND_URL}/api/searchProduct   200        data=${SEARCH_PRODUCT}
    Response Logs    ${response.status_code}    ${response.content}

GET /api/getUserDetailByEmail
    ${response}=    BackendCommonKeywords.Calling API    GET    ${BACKEND_URL}/api/getUserDetailByEmail   200        params=email=${EMAIL}
    Response Logs    ${response.status_code}    ${response.content}
    
DELETE /api/deleteAccount
    ${response}=    BackendCommonKeywords.Calling API    DELETE    ${BACKEND_URL}/api/deleteAccount   200        data=${DELETE_USER}
    Response Logs    ${response.status_code}    ${response.content}