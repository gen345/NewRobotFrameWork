*** Settings ***
Documentation       IT's containing SignUp Page variables & Keywords

Library             SeleniumLibrary
Resource            ../PageObjects/Generic.robot


*** Variables ***
${NewUserSignup}    //*[text()='New User Signup!']
${Name}             //input[@name='name']
${Email}            //input[@data-qa='signup-email']
${SignUP}           //*[text()='Signup']


*** Keywords ***
Verify 'New User Signup!' is visible
    Wait Until Element Is Visible    ${NewUserSignup}

Enter name and email address
    [Arguments]    ${InputName}    ${InputEmail}
    Input Text    ${Name}    ${InputName}
    Input Text    ${Email}    ${InputEmail}
    Sleep    2

Click 'Signup' button
    Click Element    ${SignUP}
