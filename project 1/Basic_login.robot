*** Settings ***
Documentation    new project login
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${link}    https://demowebshop.tricentis.com/
${pos_username}    sureshraina013@gmail.com
${pos_password}    123456
${neg_username}    sureshaina013@gmail.com
${neg_password}    23456


*** Test Cases ***
Automate the test case positive scenario +
    open the website
    login to the page    ${pos_username}   ${pos_password} 
    Close everything

Automate the test case negative scenario -
    open the website
    login to the page    ${neg_username}    ${neg_password}
    Close everything


*** Keywords ***

open the website
    Open Browser     ${link}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath://a[@class="ico-login"]

login to the page
    [Arguments]    ${username}    ${password}
    Click Element    xpath://a[@class="ico-login"]
    Wait Until Element Is Visible    xpath://label[@for='Email']
    Input Text    id:Email    ${username}
    Input Password    id:Password    ${password}
    Click Button      xpath://input[@type="submit"]

Close everything
    Close Browser
