*** Settings ***
Test Setup       Open Browser    ${FRONTEND_URL}    ${BROWSER} 
Test Teardown    Close Browser

Library     SeleniumLibrary
Resource    ../KeywordLibraries/FrontendHomePage.robot
Resource    ../KeywordLibraries/FrontendSignup.robot
Variables   ../TestData/Frontend_TestData.py

*** Variables ***
${FRONTEND_URL}=        ${ENV_FRONTEND_PROTOCOL}://${ENV_FRONTEND_HOST}
${BROWSER}=             Chrome

*** Test Cases ***
Home Page
    Maximize Browser Window
    FrontendHomePage.Validate_Signup_Button

User Registration
    Maximize Browser Window
    FrontendSignup.Click_Signup_Button_And_Validate_Signup_Page
    FrontendSignup.Enter_User_Details_And_Register
