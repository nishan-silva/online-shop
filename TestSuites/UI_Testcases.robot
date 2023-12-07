*** Settings ***
Library     SeleniumLibrary
Resource    ../KeywordLibraries/FrontendHomePage.robot
Resource    ../KeywordLibraries/FrontendSignup.robot
Variables   ../TestData/Frontend_TestData.py

*** Variables ***
${FRONTEND_URL}=        ${ENV_FRONTEND_PROTOCOL}://${ENV_FRONTEND_HOST}
${BROWSER}=             Chrome

*** Test Cases ***
Home Page
    Open Browser    ${FRONTEND_URL}    ${BROWSER}
    FrontendHomePage.Validate_Signup_Button
    Close Browser

User Registration
    Open Browser    ${FRONTEND_URL}    ${BROWSER}
    FrontendSignup.Click_Signup_Button_And_Validate_Signup_Page
    FrontendSignup.Enter_User_Details_And_Register    name=${NAME}    email=${EMAIL}    password=${PASSWORD}
    Close Browser