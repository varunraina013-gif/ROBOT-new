*** Settings ***
Documentation    login Credentials
Library    SeleniumLibrary

*** Variables ***
${Browser}        chrome
${link}           https://demowebshop.tricentis.com/
${username}       sureshraina013@gmail.com
${password}       123456

*** Keywords ***
Open the browser
    Open Browser         ${link}      ${Browser}
    Maximize Browser Window

Close the browser
    Close Browser




#In Robot Framework a resource file cannot contain test cases.
#*** Test Cases *** should not be there
