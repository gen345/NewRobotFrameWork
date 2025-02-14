*** Settings ***
Documentation       IT's a robot file to handle browser opening and closing

Library             SeleniumLibrary


*** Variables ***
${browser_name}     chrome
${url}              http://automationexercise.com


*** Keywords ***
Open Browser With Url
    Open Browser    ${url}    ${browser_name}
    Maximize Browser Window

Close Browser Session
    Close All Browsers
