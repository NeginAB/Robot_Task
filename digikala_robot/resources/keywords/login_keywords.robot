*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/login_page.robot
Resource   ../variables/login_test_data.robot

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

Perform Login    [Arguments]    ${phone}    ${password}
    Open Login Page
    Enter Username    ${phone}
    Click Login Button
    Enter Password     ${password}
    Click Login Button

Verify Successful Login
    Verify Login Successful
    Close Browser

Verify Failed Login
    Verify Login Failed
    Close Browser

Handle Hot Deals Modal
    [Documentation]    
    ${modal_present}=    Run Keyword And Return Status    Element Should Contain    xpath=//*[@id="modal-root"]/div/div/div/div/div[1]/div/div[1]/div/p/span    تخفیف‌های داغ، اخبار درِگوشی
    Run Keyword If    ${modal_present}    Click Element    xpath=//*[@id="modal-root"]/div/div/div/div/div[2]/div/div/button[1]/div
