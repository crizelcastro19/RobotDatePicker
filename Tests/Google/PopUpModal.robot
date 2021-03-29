*** Settings ***
Documentation    Pop Up Modals
Library     SeleniumLibrary
Library     DataDriver      file=DataDriver.xls    sheet_name=Input_Data
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot

Suite Setup         Start TestCase
Test Template       Input On Pop Up Modal
Suite Teardown      Close Browser

*** Variables ***

*** Test Cases ***
Verify the Pop Up Modal displayed       ${iframe_Create_User}  ${FULL_NAME}    ${EMAIL}    ${PASSWORD}


*** Keywords ***
Input On Pop Up Modal
       [Arguments]  ${iframe_Create_User}  ${FULL_NAME}  ${EMAIL}    ${PASSWORD}
       Select Frame                     ${iframe_Create_User}
       Wait Until Element Is Visible    ${btn_Create_User}        30
       Click Element                    ${btn_Create_User}
       Clear Element Text                ${input_Name}
       Input Text                        ${input_Name}          ${FULL_NAME}
       Clear Element Text                ${input_Email}
       Input Text                        ${input_Email}         ${EMAIL}
       Clear Element Text                ${input_Password}
       Input Text                        ${input_Password}      ${PASSWORD}
       Click Element                     ${btn_Create_account}