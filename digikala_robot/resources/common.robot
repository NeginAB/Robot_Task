*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Homepage
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Close Browser
    Close Browser
