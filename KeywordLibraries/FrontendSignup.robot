*** Settings ***
Library    SeleniumLibrary
Resource    ../KeywordLibraries/FrontendHomePage.robot
Variables   ../TestData/Frontend_TestData.py

*** Variables ***
# Signup Page Locators
${NAME_INPUT_TEXT}             //*[@id="form"]/div/div/div[3]/div/form/input[2]
${EMAIL_INPUT_TEXT}            //*[@id="form"]/div/div/div[3]/div/form/input[3]
${SIGNUP_BUTTON}               //*[@id="form"]/div/div/div[3]/div/form/button
${ACCOUNT_INFO_LABLE}          //*[@id="form"]/div/div/div/div[1]/h2/b
${MR_RADIO_BUTTON}             //*[@id="id_gender1"]
${MRS_RADIO_BUTTON}            //*[@id="id_gender2"]
${PASSWORD_INPUT_TEXT}         //*[@id="password"]
${DOB_DATE_DROPDOWN_MENU}      //select[@id="days"]
${DOB_MONTH_DROPDOWN_MENU}     //select[@id='months']
${DOB_YEAR_DROPDOWN_MENU}      //select[@id="years"]
${FIRST_NAME_INPUT_TEXT}       //*[@id="first_name"]
${LAST_NAME_INPUT_TEXT}        //*[@id="last_name"]
${COMPANY_NAME_INPUT_TEXT}     //*[@id="company"]
${ADDRESS_INPUT_TEXT}          //*[@id="address1"]
${COUNTRY_DROPDOWN_MENU}       //*[@id="country"]
${STATE_INPUT_TEXT}            //*[@id="state"]
${CITY_INPUT_TEXT}             //*[@id="city"]
${ZIP_CODE_INPUT_TEXT}         //*[@id="zipcode"]
${MOBILE_NUMBER_INPUT_TEXT}    //*[@id="mobile_number"]
${CREATE_ACCOUNT_BUTTON}       //*[@id="form"]/div/div/div/div/form/button
${CONTINUE_BUTTON}             //a[contains(text(),'Continue')]
${LOGOUT_BUTTON}               //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a/i

*** Keywords ***
Click_Signup_Button_And_Validate_Signup_Page
    Log    Executing Click Signup Button Button And Validate Signup Page
    # Calling Homepage.robot file to verify Home Page
    FrontendHomePage.Validate_Signup_Button
    SeleniumLibrary.Click Element     ${SIGNUP_AND_LOGIN_BUTTON}
    Sleep    2s
    Wait Until Element Is Visible     ${SIGNUP_BUTTON}

Enter_User_Details_And_Register
    SeleniumLibrary.Input Text        ${NAME_INPUT_TEXT}             ${NAME}
    SeleniumLibrary.Input Text        ${EMAIL_INPUT_TEXT}            ${EMAIL}
    Click Element                     ${SIGNUP_BUTTON}
    Wait Until Element Is Visible     ${ACCOUNT_INFO_LABLE}
    Element Should Be Visible         ${MR_RADIO_BUTTON}
    Element Should Be Visible         ${MRS_RADIO_BUTTON}
    Click Element                     ${MR_RADIO_BUTTON}
    SeleniumLibrary.Input Text        ${PASSWORD_INPUT_TEXT}         ${PASSWORD}
    Select From List by Index         ${DOB_DATE_DROPDOWN_MENU}      ${DOB_DATE}
    Select From List by Index         ${DOB_MONTH_DROPDOWN_MENU}     ${DOB_MONTH}
    Select From List by Index         ${DOB_YEAR_DROPDOWN_MENU}      ${DOB_YEAR}
    SeleniumLibrary.Input Text        ${FIRST_NAME_INPUT_TEXT}       ${FIRST_NAME}
    SeleniumLibrary.Input Text        ${LAST_NAME_INPUT_TEXT}        ${LAST_NAME}
    SeleniumLibrary.Input Text        ${COMPANY_NAME_INPUT_TEXT}     ${COMPANY}
    SeleniumLibrary.Input Text        ${ADDRESS_INPUT_TEXT}          ${ADDRESS}
    Select From List by Index         ${COUNTRY_DROPDOWN_MENU}       ${COUNTRY}
    SeleniumLibrary.Input Text        ${STATE_INPUT_TEXT}            ${STATE}
    SeleniumLibrary.Input Text        ${CITY_INPUT_TEXT}             ${CITY}
    SeleniumLibrary.Input Text        ${ZIP_CODE_INPUT_TEXT}         ${ZIPCODE}
    SeleniumLibrary.Input Text        ${MOBILE_NUMBER_INPUT_TEXT}    ${MOBILE_NUMBER}
    Execute JavaScript    window.scrollBy(0, 300)   # Scroll down 300 pixels
    Wait Until Element Is Visible     ${CREATE_ACCOUNT_BUTTON}
    Click Element                     ${CREATE_ACCOUNT_BUTTON}
    Click Element                     ${CONTINUE_BUTTON}
    Wait Until Element Is Visible     ${LOGOUT_BUTTON}