*** Settings ***
Documentation       IT's a robot file to handle browser opening and closing

Library             SeleniumLibrary
Library             DataDriver    file=TestData/TestData_Robot_Framework.xlsx    encoding=utf_8    dialect=unix
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/HomePage.robot
Resource            ../PageObjects/SignupPage.robot
Resource            ../PageObjects/EnterAccountInfoPage.robot

Test Setup          Open Browser With Url
Test Teardown       Close Browser Session
Test Template       Register User


*** Test Cases ***
TC01 Signup Using ${InputName}, ${InputEmail}, ${title}, ${pwd}, ${day}, ${month}, ${year}, ${checkbox1Y_N}, ${checkbox2Y_N}, ${first_name}, ${last_name}, ${company}, ${add1}, ${add2}, ${country}, ${state}, ${city}, ${zipcode}, ${ph_number}, ${msg_expected}, ${txt_deleteAccountMsg_Expected}


*** Keywords ***
Register User
    [Arguments]
    ...    ${InputName}
    ...    ${InputEmail}
    ...    ${title}
    ...    ${pwd}
    ...    ${day}
    ...    ${month}
    ...    ${year}
    ...    ${checkbox1Y_N}
    ...    ${checkbox2Y_N}
    ...    ${first_name}
    ...    ${last_name}
    ...    ${company}
    ...    ${add1}
    ...    ${add2}
    ...    ${country}
    ...    ${state}
    ...    ${city}
    ...    ${zipcode}
    ...    ${ph_number}
    ...    ${msg_expected}
    ...    ${txt_deleteAccountMsg_Expected}

    Set Selenium Implicit Wait    7
    Verify that home page is visible successfully
    Click on 'Signup / Login' button
    Verify 'New User Signup!' is visible
    Enter name and email address    ${InputName}    ${InputEmail}
    Click 'Signup' button
    Verify that 'ENTER ACCOUNT INFORMATION' is visible
    Fill details: Title Name Email Password Date of birth    ${title}    ${pwd}    ${day}    ${month}    ${year}
    Select checkbox 'Sign up for our newsletter!'    ${checkbox1Y_N}
    Select checkbox 'Receive special offers from our partners!'    ${checkbox2Y_N}
    Fill details: First name Last name Company Address Address2 Country State City Zipcode Mobile Number
    ...    ${first_name}
    ...    ${last_name}
    ...    ${company}
    ...    ${add1}
    ...    ${add2}
    ...    ${country}
    ...    ${state}
    ...    ${city}
    ...    ${zipcode}
    ...    ${ph_number}
    Click 'Create Account' button
    Verify that 'ACCOUNT CREATED!' is visible    ${msg_expected}
    Click 'Continue' button
    Verify that 'Logged in as username' is visible
    Click 'Delete Account' button
    Verify that 'ACCOUNT DELETED!' is visible and click 'Continue' button    ${txt_deleteAccountMsg_Expected}
