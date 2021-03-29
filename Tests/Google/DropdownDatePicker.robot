*** Settings ***
Documentation    Testing of Date picker with dropdown
Library    SeleniumLibrary
Library     DataDriver      file=DataDriver.xlsx    sheet_name=InformationData
Library     ExcelLibrary
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot


Suite Setup         Start TestCase
Test Template       Validate The Datepicker Using Dropdown
Suite Teardown      Close Browser
*** Variables ***


*** Test Cases ***
Validate The Datepicker Using Dropdown      ${tab_dropDown_XPATH}

*** Keywords ***
Validate The Datepicker Using Dropdown
    [Arguments]    ${tab_dropDown_XPATH}   ${MONTHS}    ${YEARS}   ${DAYS}
    Wait Until Element Is Visible    ${tab_dropDown_XPATH}      30
    Select Tab Drop Down
    Click the input picker
    Select Month Dropdown   ${MONTHS}
    Select Years Dropdown   ${YEARS}
    ${day_XPATH}    Catenate    ${day_XPATH_1}${DAYS}${day_XPATH_2}
    Select Day of the year  ${day_XPATH}