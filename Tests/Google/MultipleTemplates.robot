*** Settings ***
Library    SeleniumLibrary
Library     Collections
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot

Suite Setup     StartTestCase
Test Setup      Visit Url
*** Variables ***
${Failed}
${False}



*** Test Cases ***
Test Scenario 1
  Input FirstName   ${input_fname}
  Should Be Equal   1   1
  [Teardown]  Run Keyword If Test Failed    Set Suite Variable   ${Failed}   ${true}

Test Scenario 2
     ${filterStatus}  Run keyword and return status  Input FirstName    ${input_fname}
     Log To Console   ${filterStatus}
     Run keyword if  ${filterStatus}     Input Field     ${input_lname}

*** Keywords ***
Input FirstName
        [Arguments]    ${input_fname}
        Wait Until Element Is Visible    ${input_fname}     30
        Input Text                       ${input_fname}     Test
Input Field
        [Arguments]    ${input_lname}
        Input Text         ${input_lname}     Test
