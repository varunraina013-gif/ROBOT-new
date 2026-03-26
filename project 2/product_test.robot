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
    Click on login
    Enter the credential
    Login to the account

Land on the official page and select a product
    Check we have landed on the page
    Select a product
    Add to cart

Verify the cart page
    Go to cart and verify that we have landed on the right page
    Shipping details and estimation,agree and check out

Go to check out and give the shipping details
    Click on checkout page and fill the shipping details

Go to payment method
    Click on cash on delivery and confirm it

Confirm the order
    Check the products and address
    Click on continue


#-------------------------------------------------------------------------------------------------
*** Keywords ***
Click on login
    Click Element    xpath=//a[@href="/login"]
    Element Should Be Visible    xpath=//h1[text()='Welcome, Please Sign In!']
Enter the credential
    Input Text    id=Email    ${username}
    Input Password   id=Password     ${password}
Login to the account
    Click Element    xpath=//input[@value="Log in"]
Check we have landed on the page
    Wait Until Element Is Visible         xpath=//h2[@class="topic-html-content-header"]

Select a product
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

Add to cart
    Click Element    id=add-to-cart-button-75
    Wait Until Element Is Visible    id=bar-notification

Go to cart and verify that we have landed on the right page
    Click Element    xpath=//a[@href="/cart"]
    Wait Until Element Is Visible    xpath=//div[@class="page-title"]

Shipping details and estimation,agree and check out

    Click Element    id=CountryId
    Select From List By Label    id=CountryId    India
    Click Element    id=StateProvinceId
    Click Element    xpath=//option[@value="0"]
    Click Element    xpath=//input[@name='estimateshipping']
    Select Checkbox    xpath=//input[@id='termsofservice']
    Click Button    id=checkout


Click on checkout page and fill the shipping details
    Wait Until Element Is Visible    xpath=//div[@class='page-title']//h1[text()='Checkout']
    Click Element    xpath=//div[@id='billing-buttons-container']
    Click Element    xpath=//input[@onclick="Billing.save()"]
    Wait Until Element Is Visible    xpath=//input[@id='PickUpInStore']    10s
    Click Element    xpath=//input[@id='PickUpInStore']
    Execute Javascript    window.scrollBy(0,300)
    Click Element    xpath=//input[@onclick="Shipping.save()"]
    sleep    5s

Click on cash on delivery and confirm it
    Click Element    id=paymentmethod_0
    Click Element    xpath=//input[@onclick="PaymentMethod.save()"]
    Sleep    5s
    Element Should Be Visible    xpath=//p[text()='You will pay by COD']
    Click Element    xpath=//input[@onclick="PaymentInfo.save()"]


Check the products and address

    Wait Until Element Is Enabled    xpath=//strong[text()='Billing Address']    10s
    Wait Until Element Is Enabled    xpath=//strong[text()='Payment Method']    10s
    Execute Javascript    window.scrollBy(0,500)
    Wait Until Element Is Enabled    xpath=//span[@class="nobr"]

Click on continue

    Click Element    xpath=//input[@onclick="ConfirmOrder.save()"]




