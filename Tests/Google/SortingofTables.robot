*** Settings ***
Documentation    Sorting Tables
Library     SeleniumLibrary
Library     Collections
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot


Suite Setup        Start TestCase
Test Setup         Visit Url
#Test Teardown      Close Browser
*** Variables ***
*** Test Cases ***

Verify that the table should be sorted Ascending via Name
    Sort Table via Name Ascending
    Sort Name

Verify that the table should be sorted Descending via Name
     Sort Table via Name Ascending
     Sort Table via Name Descending
     Sort Name Desc

Verify if the Name is Existing on the Table
     Pagination

*** Keywords ***
Sort Name
         @{username_list}=   Create List
         @{get_name} =       Get WebElements          css=#example > tbody > tr> td:nth-child(1)
         FOR    ${each}     IN      @{get_name}
             ${names} =  Get Text    ${each}
              Append To List  ${username_list}  ${names}
              ${sorted} =    Evaluate     sorted(${username_list}, key=str, reverse=True)
              Lists Should Be Equal    ${username_list}    ${sorted}
         END
Sort Name Desc
         @{username_list}=   Create List
         @{get_name} =       Get WebElements          css=#example > tbody > tr> td:nth-child(1)
         FOR    ${each}     IN      @{get_name}
             ${names} =  Get Text    ${each}
              Append To List  ${username_list}  ${names}
              ${sorted} =    Evaluate     sorted(${username_list}, key=str, reverse=False)
              Lists Should Be Equal    ${username_list}    ${sorted}

         END

Pagination
#        ${first_row_locator}    Set Variable    //tr[@role="row"]
#         ${total_count}    set variable    0

        FOR    ${n}    IN RANGE    1       100
                ${search} =   Run Keyword And Return Status  Element Should Be Visible     ${data_Search}
                Log To Console    ${search}
                Run Keyword If    ${search}    Log To Console    Passed
                ...               ELSE
                ...               Click Element    ${btn_Next}
                Exit For Loop If    ${search}
        END
#        Click Element    ${dropdown_entries}
#        Select From List By Value    ${dropdown_entries}       100
#        FOR     ${index}    IN RANGE     1     50
#                ${search} =   Run Keyword And Return Status  Element Should Be Visible     ${data_Search}
#                Run Keyword If    ${search}    Log To Console    Passed
#                ...               ELSE
#                ...               Click Element    ${btn_Next}

#        END