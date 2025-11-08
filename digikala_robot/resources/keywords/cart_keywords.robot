*** Settings ***
Resource   ../pages/product_page.robot

*** Keywords ***
Add Laptop And Checkout
    Handle Hot Deals Modal
    Open Category Menu
    Handle Hot Deals Modal
    Select Laptop Category
    Handle Hot Deals Modal
    Select Product
    Handle Hot Deals Modal
    Add Product To Cart
    Handle Hot Deals Modal
    Go To Cart
    Verify Product In Cart

*** Keywords ***
Open Digikala Website
    [Documentation]    

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --disable-notifications
    ${prefs}=    Create Dictionary    profile.default_content_setting_values.notifications=2
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Create WebDriver    Chrome    options=${options}

    Go To    https://www.digikala.com

    Run Keyword And Ignore Error    Click Button    xpath=//button[contains(text(),"بله! حتما")]
    Handle Hot Deals Modal


