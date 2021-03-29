*** Settings ***
Documentation    Sorting Tables
Library     SeleniumLibrary
Library     Collections
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot



Test Setup         Start TestCase
#Test Teardown      Close Browser
*** Variables ***
*** Test Cases ***

Verify that the table should be sorted Ascending via Name
    Sort Table via Name Ascending
    Sort Name

Verify that the table should be sorted Descending via Name


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
