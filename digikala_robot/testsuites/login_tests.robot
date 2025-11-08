*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords/login_keywords.robot
Resource   ../resources/variables/login_test_data.robot
Test Setup    Handle Hot Deals Modal

*** Test Cases ***
Login with valid credentials
    [Tags]    happy
    Open Digikala Website
    Perform Login    ${VALID_PHONE}    ${VALID_OTP}
    Verify Successful Login

Login with invalid credentials
    [Tags]    negative
    Open Digikala Website
    Perform Login    ${VALID_PHONE}    ${INVALID_OTP}
    Verify Failed Login
