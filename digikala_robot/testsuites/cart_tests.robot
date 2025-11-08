*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords/cart_keywords.robot
Resource   ../resources/variables/login_test_data.robot
Test Setup    Handle Hot Deals Modal
Test Teardown    Close Browser

*** Test Cases ***
Add Laptop To Cart And Checkout
    [Tags]    happy
    Open Digikala Website
    Add Laptop And Checkout
