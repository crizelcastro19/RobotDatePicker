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

Verify Pagination getting of rows
     Pagination Getting the Number of rows in every pages

Verify Search with Pagination
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

Pagination Getting the Number of rows in every pages
         ${total_count}    set variable    0
         ${count} =   Get Element Count    ${pagination_size}

        FOR     ${page_num}    IN RANGE     1   ${count}+1
                log to console  "Fetching Items from Page Number:" ${pagenum}
                ${rows}=      Get Element Count    css=#example > tbody > tr
                Log To Console    "Fetching Items:" ${rows}
                ${btn_Next_enabled} =   Run Keyword And Return Status  Element Should Be Enabled     ${btn_Next}
                Run Keyword If    ${btn_Next_enabled}       Click Element    ${btn_Next}
                ...             ELSE
                ...             Click Element    ${btn_Prev}
        END

Pagination
        Click Element    ${dropdown_entries}
        Select From List By Value    ${dropdown_entries}       100
        ${rows}=      Get Element Count    css=#example > tbody > tr
        FOR     ${index}    IN RANGE     1     ${rows}+1
                ${search} =   Run Keyword And Return Status  Element Should Be Visible     ${data_Search}
                Run Keyword If    ${search}    Log To Console    Passed
                ...               ELSE
                ...               Click Element    ${btn_Next}
        END