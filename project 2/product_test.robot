*** Settings ***
Documentation    New testcase for desktops
Library    SeleniumLibrary
Library    Collections
Suite Setup     Open the browser
Suite Teardown    Close the browser
Resource    Resource.robot

*** Variables ***
${username}       sureshraina013@gmail.com
${password}       123456


*** Test Cases ***
Login to the website
    click on login
    enter the credential
    login to the account

land on the official page and select a product
    check we have landed on the page
    select a product
    add to cart

Verify the cart page
    go to cart and verify that we have landed on the right page
    shipping details and estimation,agree and check out

go to check out and give the shipping details
    Click on checkout page and fill the details
#    Enter the information
#    Click Continue
#-------------------------------------------------------------------------------------------------
*** Keywords ***
click on login
    Click Element    xpath=//a[@href="/login"]
    Element Should Be Visible    xpath=//h1[text()='Welcome, Please Sign In!']
enter the credential
    Input Text    id=Email    ${username}
    Input Password   id=Password     ${password}
login to the account
    Click Element    xpath=//input[@value="Log in"]
check we have landed on the page
    Wait Until Element Is Visible         xpath=//h2[@class="topic-html-content-header"]

select a product
    Double Click Element        xpath=//a[@href="/computers"]
    Click Element    xpath=//a[@title="Show products in category Desktops"]
    Click Element    xpath=//select[@id="products-orderby"]
    Select From List By Label    xpath=//select[@id="products-orderby"]    Name: Z to A
    Wait Until Element Is Visible    xpath=//h2[@class="product-title"]    5s
    Click Element    xpath=//h2[@class="product-title"]
    Execute Javascript    window.scrollBy(0,500)
    Click Element    id=product_attribute_75_5_31_96
    Click Element    xpath=//label[@for='product_attribute_75_6_32_99']
    Click Element    id=product_attribute_75_6_32_99
    Click Element    id=product_attribute_75_8_35_108

add to cart
    Click Element    id=add-to-cart-button-75
    Wait Until Element Is Visible    id=bar-notification

go to cart and verify that we have landed on the right page
    Click Element    xpath=//a[@href="/cart"]
    Wait Until Element Is Visible    xpath=//div[@class="page-title"]

shipping details and estimation,agree and check out

    Click Element    id=CountryId
    Select From List By Label    id=CountryId    India
    Click Element    id=StateProvinceId
    Click Element    xpath=//option[@value="0"]
    Click Element    xpath=//input[@name='estimateshipping']
    Select Checkbox    xpath=//input[@id='termsofservice']
    Click Button    id=checkout


Click on checkout page and fill the details
    Wait Until Element Is Visible    xpath=//div[@class='page-title']//h1[text()='Checkout']
    Click Element    xpath=//div[@id='billing-buttons-container']
    Click Element    xpath=//input[@onclick="Billing.save()"]
    Wait Until Element Is Visible    xpath=//input[@id='PickUpInStore']    10s
    Click Element    xpath=//input[@id='PickUpInStore']
