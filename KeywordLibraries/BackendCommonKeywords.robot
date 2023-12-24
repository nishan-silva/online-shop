*** Settings ***
Documentation    Keywords that can be used in all suites are stored here.
Library    RequestsLibrary
Library    Collections
Library    ../Libraries/MongoDBKeywords.py

*** Keywords ***
# Backend
Calling API
    [Arguments]    ${method}    ${endpoint}    ${status_code}    ${params}=${None}    ${data}=${None}    ${error_message}=${empty}
    ${response}=    Run Keyword    RequestsLibrary.${method}    ${endpoint}    params=${params}    data=${data}    expected_status=${status_code}
    ${parsed_response}=    Set Variable    ${response}
    [Return]    ${parsed_response}

Validating_Response_Message
    [Arguments]    ${actual_response}    ${parameter_name}    ${expected_value}
    ${response_dict}=    Evaluate    json.loads($actual_response)    json
    ${actual_parameter_value}=    Get From Dictionary    ${response_dict}    ${parameter_name}
    Should Be Equal As Strings    ${actual_parameter_value}    ${expected_value}
    
Response Logs
    [Arguments]    ${status_code}    ${content}
    Log To Console    ${status_code}
    Log To Console    ${content.decode('utf-8')}