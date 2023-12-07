*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Signup Page Locators
${SIGNUP_BUTTON}    //*[@id="form"]/div/div/div[3]/div/form/button
${NAME_INPUT_TEXT}    //*[@id="form"]/div/div/div[3]/div/form/input[2]
${EMAIL_INPUT_TEXT}    //*[@id="form"]/div/div/div[3]/div/form/input[3]
${SIGNUP_BUTTON}    //*[@id="form"]/div/div/div[3]/div/form/button
${ACCOUNT_INFO_LABLE}    //*[@id="form"]/div/div/div/div[1]/h2/b
${MR_RADIO_BUTTON}    //*[@id="id_gender1"]
${MRS_RADIO_BUTTON}    //*[@id="id_gender2"]
${PASSWORD_INPUT_TEXT}    //*[@id="password"]
${DOB_DATE_DROPDOWN_MENU}    //select[@id="days"]
${DOB_MONTH_DROPDOWN_MENU}    //select[@id='months']
${DOB_YEAR_DROPDOWN_MENU}    //select[@id="years"]

*** Keywords ***
Click_Signup_Button_And_Validate_Signup_Page
    Log    Executing Click Signup Button Button And Validate Signup Page
    Maximize Browser Window
    # Calling Homepage.robot file to verify Home Page
    FrontendHomePage.Validate_Signup_Button
    SeleniumLibrary.Click Element    ${SIGNUP_AND_LOGIN_BUTTON}
    Sleep    2s
    Wait Until Element Is Visible    ${SIGNUP_BUTTON}

Enter_User_Details_And_Register
    [Arguments]    ${name}=${None}    ${email}=${None}    ${password}=${None}    ${dob_date}=${None}    ${dob_month}=${None}    ${dob_year}=${None}
    SeleniumLibrary.Input Text    ${NAME_INPUT_TEXT}    ${name}
    SeleniumLibrary.Input Text    ${EMAIL_INPUT_TEXT}    ${email}
    Click Element    ${SIGNUP_BUTTON}
    Wait Until Element Is Visible    ${ACCOUNT_INFO_LABLE}
    Element Should Be Visible    ${MR_RADIO_BUTTON}
    Element Should Be Visible    ${MRS_RADIO_BUTTON}
    Click Element    ${MR_RADIO_BUTTON}
    Execute JavaScript    window.scrollBy(0, -500)
    SeleniumLibrary.Input Text    ${PASSWORD_INPUT_TEXT}    ${password}
    Select From List by Index  ${DOB_DATE_DROPDOWN_MENU}    ${dob_date}
    Select From List by Index    ${DOB_MONTH_DROPDOWN_MENU}    ${dob_month}
    Select From List by Index    ${DOB_YEAR_DROPDOWN_MENU}    ${dob_year}
    Execute JavaScript    window.scrollBy(0, -500)
    Sleep    3s
