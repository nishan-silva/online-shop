*** Settings ***
Documentation   Test Product API of the backend
Library    RequestsLibrary


*** Variables ***
${URL}=         ${ENV_BACKEND_HOST}
${TIMEOUT}=     5

*** Keywords ***

*** Test Cases  ***
GET /api/productsList
${response}=    GET     ${URL}