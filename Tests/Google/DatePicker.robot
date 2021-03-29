*** Settings ***
Documentation   DatePickerTesting
Library  SeleniumLibrary
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot
Suite Setup         Start TestCase
Test Template       Validate the datepicker in booking
Suite Teardown      Close Browser



*** Test Cases ***
Validate Start Date     ${start_Date}


*** Keywords ***
Validate the datepicker in booking
     [Arguments]     ${start_Date}
     Wait Until Element Is Visible     ${start_Date}    30
     Click Element     ${start_Date}
      FOR    ${Index}    IN RANGE    1   31
          ${isElementExist} =  Run Keyword And Return Status     Element Should Be Visible      ${click_Date}
#         Log To Console    ${isElementExist}
          ${check_element} =   Run Keyword And Return Status   Should Not Contain       ${click_Date}         ${class_disabled}

          Run Keyword If     ${isElementExist}      Click Element    ${click_Date}
                ...         ELSE
                ...         Click Element      ${btn_nextDate}
          Exit For Loop If    ${isElementExist}
      END