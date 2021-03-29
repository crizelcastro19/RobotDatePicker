*** Settings ***
Documentation    Basic Testing
Library     SeleniumLibrary
Library     DataDriver      file=DataDriver.xlsx    sheet_name=TestData
Library     ExcelLibrary
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot
Suite Setup         Start TestCase
Test Template       Input the Search Data from Excel to Textbox
Suite Teardown      Close Browser

*** Variables ***
${ERROR_URL} =  http://www.testyou.in/Login.aspx

*** Test Cases ***
Invalid Username                 invalid                ${password_XPATH}
Invalid Password                 ${username_XPATH}      invalid
Invalid Username And Password    ${EMPTY}               ${EMPTY}
Empty Username                   ${EMPTY}               ${password_XPATH}
Empty Password                   ${username_XPATH}      ${EMPTY}
Empty Username And Password      ${EMPTY}               ${EMPTY}

*** Keywords ***
Input the Search Data from Excel to Textbox
    [Arguments]    ${USERNAME}  ${PASSWORD}
    Wait until element is visible       ${username_XPATH}     30
    Input Username  ${USERNAME}
    Input Password  ${PASSWORD}
    SubmitLogin
    Login Should Have Failed

Start TestCase
    Open Browser    ${URL}      ${Browser}
    Maximize Browser Window

Input Username
    [Arguments]    ${USERNAME}
    Input Text    ${username_XPATH}     ${USERNAME}
Input Password
     [Arguments]   ${PASSWORD}
     Input Text    ${password_XPATH}    ${PASSWORD}
SubmitLogin
     Click Button    ${btn_Login_XPATH}

Login Should Have Failed
    Location Should Be    ${ERROR_URL}



