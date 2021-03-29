*** Settings ***
Documentation    Testing of Date picker with icon trigger
Library    SeleniumLibrary
Library     DataDriver      file=DataDriver.xls    sheet_name=InformationData
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot

Suite Setup         Start TestCase
Test Template       Validate The Datepicker Using Icon Trigger
#Suite Teardown      Close Browser

*** Variables ***

*** Test Cases ***
Verify the Date Picker       ${icon_calendar_XPATH}     ${DAY}

*** Keywords ***
Validate The Datepicker Using Icon Trigger
        [Arguments]     ${icon_calendar_XPATH}   ${DAY}   ${MONTH}  ${YEAR}
        Wait Until Element Is Visible    ${tab_iconTrigger_XPATH}       30
        Click Tab Icon Trigger
        Select Frame                     ${iframe_XPATH}
        Wait Until Element Is Visible    ${icon_calendar_XPATH}         30
        Click Icon Calendar
        ${date}     Catenate             ${click_date_1}${DAY}${click_date_2}
        ${month_1}  Catenate             ${month_XPATH_1}${MONTH}${month_XPATH_2}
        ${year_1}   Catenate             ${year_XPATH_1}${YEAR}${year_XPATH_2}
        Select Date                      ${date}    ${month_1}   ${year_1}

Select Date
         [Arguments]    ${date}   ${month_1}   ${year_1}

          FOR    ${Index}    IN RANGE    1   50
              ${Month_Exist} =  Run Keyword And Return Status     Element Should Be Visible      ${month_1}
              ${Year_Exist} =   Run Keyword And Return Status     Element Should Be Visible      ${year_1}
              Run Keyword If    ${Month_Exist} and ${Year_Exist}   Click Element     ${date}
              ...       ELSE
              ...       Click Element    ${btn_Next_XPATH}
              Exit For Loop If    ${Month_Exist} and ${Year_Exist}
          END
Click Icon Calendar
    Click Element      ${icon_calendar_XPATH}

Click Tab Icon Trigger
    Click Element      ${tab_iconTrigger_XPATH}