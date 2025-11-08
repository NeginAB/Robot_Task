*** Variables ***
${LOGIN_REGISTER}       //button[contains(., 'ورود | ثبت‌نام')]
${USERNAME_INPUT}       //input[@id='username']
${LOGIN_BUTTON}         //input[@id='dk-login']
${PASSWORD_INPUT}       //input[@id='password']
${HIDE_PASSWORD}        xpath=//*[name()='use' and @href='#visibility-on']
${USER_NAME_DISPLAY}    css=p.text-h5.text-neutral-800
${LOGOUT_BUTTON}        //span[contains(text(),'خروج از حساب کاربری')]
${PROFILE_BUTTON}       xpath=//div[@data-icon-name='cube-alert-notification-outline']
${ERROR_MESSAGE}        xpath=//div[@id="toast-msg" and contains(text(), "اطلاعات کاربری نادرست است")]


*** Keywords ***
Open Login Page
    [Documentation]    Opens the Digikala login popup.
    Wait Until Element Is Visible    ${LOGIN_REGISTER}    30s
    Click Element    ${LOGIN_REGISTER}

Enter Username
    [Arguments]    ${phone}
    [Documentation]    Inputs the user's phone number.
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${phone}

Click Login Button
    [Documentation]    Clicks the main login button.
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    10s
    Click Element    ${LOGIN_BUTTON}

Enter Password
    [Arguments]    ${password}
    [Documentation]    Inputs the OTP or password in the login form.
    Wait Until Element Is Visible    ${PASSWORD_INPUT}    10s
    Input Text    ${PASSWORD_INPUT}    ${password}

Hide Password
    [Documentation]    Toggles password visibility.
    Wait Until Element Is Visible    ${HIDE_PASSWORD}    10s
    Click Element    ${HIDE_PASSWORD}

Verify Login Successful
    [Documentation]    Confirms login by checking the profile menu.
    Wait Until Element Is Visible    ${PROFILE_BUTTON}    30s
    Click Element    ${PROFILE_BUTTON}
    Wait Until Element Is Visible    ${USER_NAME_DISPLAY}    15s
    ${user_name}=    Get Text    ${USER_NAME_DISPLAY}
    Should Be Equal    ${user_name}    نگين عابديان


Verify Login Failed
    [Documentation]    Validates that login failed by detecting the error message.
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    15s

Reload Home Page
    [Documentation]    Reloads Digikala homepage to reset state.
    Go To    ${BASE_URL}
    Wait Until Page Contains Element    ${LOGIN_REGISTER}    30s

Close Digikala Browser
    [Documentation]    Closes all Digikala-related browser sessions.
    Close All Browsers
