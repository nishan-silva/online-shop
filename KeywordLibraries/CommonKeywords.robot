*** Settings ***
Documentation    Keywords that can be used in all suites are stored here.
Library    RequestsLibrary

*** Keywords ***
Calling API
    [Arguments]    ${method}    ${endpoint}    ${status_code}    ${params}=${None}    ${data}=${None}    ${error_message}=${empty}
    ${response}=    Run Keyword    RequestsLibrary.${method}    ${endpoint}    params=${params}    data=${data}    expected_status=${status_code}
    ${parsed_response}=    Set Variable    ${response}
    [Return]    ${parsed_response}