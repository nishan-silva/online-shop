*** Settings ***
Documentation   Test Product API of the backend
Library    RequestsLibrary


*** Variables ***
#${URL}=         ${ENV_BACKEND_HOST}
#${TIMEOUT}=     5

${URL}      https://automationexercise.com

*** Test Cases  ***
GET /api/productsList
    Create Session    myssion    ${URL}
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET    ${URL}/api/productsList
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}