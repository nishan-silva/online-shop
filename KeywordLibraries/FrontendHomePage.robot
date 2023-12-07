*** Variables ***
# Home Page Locators
${SIGNUP_AND_LOGIN_BUTTON}    //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

*** Keywords ***
Validate_Signup_Button
    Log    Executing Validate Signup Button Button
    Sleep    2s
    Maximize Browser Window
    Wait Until Element Is Visible    ${SIGNUP_AND_LOGIN_BUTTON}