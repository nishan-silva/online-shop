*** Settings ***
Documentation    Keywords that can be used in all suites are stored here.
Library    RequestsLibrary
Library    Collections

*** Keywords ***
Calling API
    [Arguments]    ${method}    ${endpoint}    ${status_code}    ${params}=${None}    ${data}=${None}    ${error_message}=${empty}
    ${response}=    Run Keyword    RequestsLibrary.${method}    ${endpoint}    params=${params}    data=${data}    expected_status=${status_code}
    ${parsed_response}=    Set Variable    ${response}
    [Return]    ${parsed_response}

Validating Response Message
    [Arguments]    ${actual_response}    ${expected_message}
    ${response_dict}=    Evaluate    json.loads($actual_response)    json
    ${actual_message}=    Get From Dictionary    ${response_dict}    message
    Should Be Equal As Strings    ${actual_message}    ${expected_message}
    
Response Logs
    [Arguments]    ${status_code}    ${content}
    Log To Console    ${status_code}
    Log To Console    ${content.decode('utf-8')}