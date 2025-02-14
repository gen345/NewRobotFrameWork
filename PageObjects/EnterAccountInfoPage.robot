*** Settings ***
Documentation       Page object for the 'Enter Account Information' section

Library             SeleniumLibrary
Library             XML


*** Variables ***
${CnfMsg}               //b[text()='Enter Account Information']
${Password}             //*[@name='password']
${dropDown_BDate}       //*[@id='days']
${dropDown_BMnth}       //*[@name='months']
${dropDown_BYear}       //*[@name='years']
${ChecKBox1}            id:newsletter
${ChecKBox2}            id:optin
${FirstNameField}       xpath://*[@id='first_name']
${LastNameField}        xpath://*[@name='last_name']
${CompanyField}         xpath://*[@id='company']
${Add1Field}            xpath://*[@name='address1']
${Add2Field}            xpath://*[@name='address2']
${DropDown-Country}     xpath://*[@name='country']
${StateField}           xpath://*[@name='state']
${CityField}            xpath://*[@name='city']
${zipcodeField}         xpath://*[@name='zipcode']
${ph_numberField}       xpath://*[@name='mobile_number']
${CreateAccBttn}        css:.btn-default
${AccountCreatedMsg}            xpath://h2/b
${CntBtn}               xpath://*[contains(@class,'btn-primary')]
${loggeduser}           xpath://*[contains(@class,'fa-user')] /../b
${DelBtn}               xpath://*[@href='/delete_account']
${AccDltMsg}            xpath://h2/b


*** Keywords ***
Verify that 'ENTER ACCOUNT INFORMATION' is visible
    ${LoginFormMsg}=    Get Text    ${CnfMsg}
    Should Be Equal As Strings    ${LoginFormMsg}    ENTER ACCOUNT INFORMATION

Fill details: Title Name Email Password Date of birth
    [Arguments]    ${title}    ${pwd}    ${day}    ${month}    ${year}

    Click Element    //input[@value="${title}"]
    Input Password    ${Password}    ${pwd}
    Select From List By Label    ${dropDown_BDate}    ${day}
    Select From List By Label    ${dropDown_BMnth}    ${month}
    Select From List By Label    ${dropDown_BYear}    ${year}

Select checkbox 'Sign up for our newsletter!'
    [Arguments]    ${checkbox1Y_N}
    Wait Until Element Is Visible    ${ChecKBox1}
    IF    $checkbox1Y_N == 'Check'
        Execute JavaScript    document.getElementById('newsletter').click()
    END

Select checkbox 'Receive special offers from our partners!'
    [Arguments]    ${checkbox2Y_N}
    IF    $checkbox2Y_N == 'Check'    Click Element    ${ChecKBox2}

Fill details: First name Last name Company Address Address2 Country State City Zipcode Mobile Number
    [Arguments]
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

    Input Text    ${FirstNameField}    ${first_name}
    Input Text    ${LastNameField}    ${last_name}
    Input Text    ${CompanyField}    ${company}
    Input Text    ${Add1Field}    ${add1}
    Input Text    ${Add2Field}    ${add2}
    Select From List By Value    ${DropDown-Country}    ${country}
    Input Text    ${StateField}    ${state}
    Input Text    ${CityField}    ${city}
    Input Text    ${zipcodeField}    ${zipcode}
    Input Text    ${ph_numberField}    ${ph_number}

Click 'Create Account' button
    Click Element    ${CreateAccBttn}

Verify that 'ACCOUNT CREATED!' is visible
    [Arguments]    ${msg_expected}
    ${MsgDisplaying}=    Get Text    ${AccountCreatedMsg}
    Should Be Equal    ${MsgDisplaying}    ${msg_expected}    ignore_case=True   
    
Click 'Continue' button
    Click Element    ${CntBtn}

Verify that 'Logged in as username' is visible
    Wait Until Element Is Visible    ${loggeduser}

Click 'Delete Account' button
    Click Element    ${DelBtn}

Verify that 'ACCOUNT DELETED!' is visible and click 'Continue' button
    [Arguments]    ${txt_deleteAccountMsg_Expected}
    ${ActualMsg2}=    Get Text    ${AccDltMsg}
    Should Be Equal     ${ActualMsg2}    ${txt_deleteAccountMsg_Expected}    ignore_case=True