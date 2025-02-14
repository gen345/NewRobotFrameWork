*** Settings ***
Documentation       IT's a robot file to handle browser opening and closing

Library             SeleniumLibrary
Resource            ../PageObjects/Generic.robot


*** Variables ***
${Home_Page_Button}         css:.fa-home
${Signup/Login_Button}      //a[@href="/login"]


*** Keywords ***
Verify that home page is visible successfully
    Wait Until Element Is Visible    ${Home_Page_Button}

Click on 'Signup / Login' button
    Click Element    ${Signup/Login_Button}
