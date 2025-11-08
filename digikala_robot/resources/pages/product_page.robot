*** Variables ***
${CATEGORY_MENU}        xpath=//span[contains(text(),'دسته‌بندی کالاها')]
${LAPTOP_CATEGORY}      xpath=//p[contains(text(),'لپ تاپ')]
${PRODUCT_IMAGE}        xpath=//img[@src='https://dkstatics-public.digikala.com/digikala-admin-landing/e223338d1e54364bcada15a040d404363d6c7782_1746606641.jpg']
${PRODUCT_ITEM}         xpath=//h3[contains(text(),'لپ‌تاپ اپل مدل MacBook Air MC6T4 2025 LLA')]
${CART_ICON}            xpath=//*[@id="success-add-to-cart-content"]/div[1]/div[2]/a/div/div/span
${CART_PRODUCT_TITLE}    xpath=//div[@class='bg-neutral-000 py-4 lg:pr-4 mx-4 lg:mx-0']//div[@class='styles_CartItem__grid__rZXPE']//div[@class='overflow-x-hidden']//div//h3[@class='text-neutral-800 text-body1-strong mb-2'][contains(text(),'لپ تاپ 14 اینچی ایسوس مدل Vivobook Go 14 E410KA-CL')]
${LAPTOP_CATEGORY}  //a[@class='w-full flex items-center py-3 px-2 styles_mainCategory__exEdo']//span[contains(text(),'لپ تاپ')]
${FIRST_LAPTOP}     (//body//section//a[1]/div[1]/picture[1]/img[1])[1]
${SPECIFIC_LAPTOP}    xpath=//h3[contains(text(),"Vivobook Go 14 E410KA-CL464")]/ancestor::a
${ADD_TO_CART_BUTTON}    xpath=//button[.//div[contains(text(),'افزودن به سبد خرید')]]


*** Keywords ***
Open Category Menu
    Wait Until Element Is Visible    ${CATEGORY_MENU}    timeout=10s
    Click Element    ${CATEGORY_MENU}
    Sleep    1s  

Select Laptop Category
    Wait Until Element Is Visible    ${LAPTOP_CATEGORY}    timeout=10s
    Scroll Element Into View    ${LAPTOP_CATEGORY}
    Click Element    ${LAPTOP_CATEGORY}
    Sleep                            1s

Select Product
    Wait Until Element Is Visible    ${FIRST_LAPTOP}    timeout=10s
    Scroll Element Into View         ${FIRST_LAPTOP}
    Click Element                    ${FIRST_LAPTOP}
    Sleep    1s

    Wait Until Page Contains Element    ${SPECIFIC_LAPTOP}    timeout=30s

    Scroll Element Into View             ${SPECIFIC_LAPTOP}
    
    Wait Until Element Is Visible        ${SPECIFIC_LAPTOP}    timeout=10s

    ${status}=    Run Keyword And Return Status    Click Element    ${SPECIFIC_LAPTOP}
    
    Run Keyword If    '${status}'=='False'    Execute Javascript    arguments[0].click();    ${SPECIFIC_LAPTOP}
    
    Sleep    1s                                 

Add Product To Cart
    [Documentation]    [translate:رفتن به لینک محصول و کلیک “افزودن به سبد خرید”]
    
    Open Browser    https://www.digikala.com/product/dkp-16942497/%D9%84%D9%BE-%D8%AA%D8%A7%D9%BE-14-%D8%A7%DB%8C%D9%86%DA%86%DB%8C-%D8%A7%DB%8C%D8%B3%D9%88%D8%B3-%D9%85%D8%AF%D9%84-vivobook-go-14-e410ka-cl464-celeron-n4500-4gb-ddr4-3200mhz-64gb-emmc-tn-w/?variant_id=72180044    chrome
    Wait Until Page Contains Element    xpath=//button[.//div[contains(text(),'افزودن به سبد خرید')]]    60s
    Scroll Element Into View    xpath=//button[.//div[contains(text(),'افزودن به سبد خرید')]]
    Sleep    1s
    ${status}=    Run Keyword And Return Status    Click Element    xpath=//button[.//div[contains(text(),'افزودن به سبد خرید')]]
    Run Keyword If    '${status}'=='False'    Execute Javascript    document.querySelector('button[.//div[contains(text(),"افزودن به سبد خرید")]]').click()
    Sleep    2s
  

Go To Cart
    [Documentation]    [translate:رفتن به سبد خرید و کلیک روی آیکون]
    Wait Until Element Is Visible    ${CART_ICON}    timeout=20s
    Scroll Element Into View         ${CART_ICON}
    Sleep                            2s
    ${status}=    Run Keyword And Return Status    Click Element    ${CART_ICON}
    Run Keyword If    '${status}'=='False'    Execute Javascript    arguments[0].click();    ${CART_ICON}
    Sleep    2s

Verify Product In Cart
    [Documentation]    
    Wait Until Element Is Visible    ${CART_PRODUCT_TITLE}    timeout=30s
    Scroll Element Into View         ${CART_PRODUCT_TITLE}
    Sleep                            0.5s
    ${product_text}=    Get Text    ${CART_PRODUCT_TITLE}
    Should Contain    ${product_text}    Vivobook Go 14

Scroll Page Down
    [Documentation]    
    Execute JavaScript    window.scrollBy(0, 500);
    Sleep    0.5s

Handle Hot Deals Modal
    [Documentation]    
    ${modal_present}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//span[contains(text(),'تخفیف‌های داغ، اخبار درِگوشی')]    timeout=5s
    Run Keyword If    ${modal_present}    Wait Until Element Is Enabled    xpath=//*[@id="modal-root"]/div/div/div/div/div[2]/div/div/button[1]/div    timeout=5s
    Run Keyword If    ${modal_present}    Click Element    xpath=//*[@id="modal-root"]/div/div/div/div/div[2]/div/div/button[1]/div
