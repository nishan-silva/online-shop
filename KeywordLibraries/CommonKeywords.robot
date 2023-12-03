*** Settings ***
Documentation    Keywords that can be used in all suites are stored here.
Library    RequestsLibrary

*** Keywords ***
Get User Details
    [Arguments]    ${url}    ${email}
    Create Session    mysession    ${url}
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET    ${url}/api/getUserDetailByEmail?email=${email}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    [Return]    ${response}

Extract User Data
    [Arguments]    ${response}
    ${json}=    Evaluate    json.loads($response.content)
    ${userData}=    Set Suite Variable    ${json}    # or extract necessary user data
    [Return]    ${userData}
