*** Settings ***
Documentation    login and product view & validation
Library    SeleniumLibrary

*** Variables ***
${link}           https://demowebshop.tricentis.com/
${Browser}        chrome
${username}       sureshraina013@gmail.com
${password}       123456
${CELL_PHONES}    cell phones


*** Test Cases ***
Login to the website
    Open Browser and login to the website
    Enter the credential
    click on product
    move to check out

*** Keywords ***
Open Browser and login to the website
    Open Browser    ${link}    ${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//img[@alt="Tricentis Demo Web Shop"]
    Click Link    xpath=//a[@class="ico-login"]

Enter the credential
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Welcome')]
    Input Text    id=Email    ${username}
    Input Password    name=Password    ${password}
    Click Button    xpath=//input[@value="Log in"]
    Wait Until Element Is Visible    xpath=//h2[@class="topic-html-content-header"]

Click on product
    Click Element    xpath=//a[@href="/electronics"]
    Click Element    xpath=//img[@alt="Picture for category Cell phones"]
    Click Element    xpath=//h2[@class="product-title"]
    Element Should Be Visible    xpath=//div[@class="short-description"]
    Click Element    xpath=//input[@value="Add to cart"]
    Click Element    xpath=//span[@class="cart-label"]
    Sleep    4s

Move to check out
    Click Element    id=CountryId
    Click Element    xpath=//option[@value="41"]
    Click Element    id=StateProvinceId
    Click Element    xpath=//option[@value="0"]
    Click Button    xpath=//input[@name="estimateshipping"]
    Sleep    6s
    Select Checkbox    xpath=//input[@id="termsofservice"]
    Click Button    id=checkout
    





    

