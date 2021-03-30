*** Settings ***
Library    SeleniumLibrary
Library     Collections
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot


Suite Setup     StartTestCase
Test Setup      Visit Url
#Test Teardown   Close Browser
*** Variables ***

@{LOCATORS}       ${input_username_twitter}    ${input_password_twitter}
@{EXPECTED_VALUES}         one     two     three

*** Test Cases ***

Verify the Window Pop Up for Twitter

    Follow Twitter Button
    Twitter New Window
    Input Text Username         ${input_username_twitter}
    Input Text Password         ${input_password_twitter}

Verify Input String
    Follow Twitter Button
    Twitter New Window
    Input Text Username         ${input_username_twitter}
    Input Text Password         ${input_password_twitter}
    Check String                ${LOCATORS}    ${EXPECTED_VALUES}


*** Keywords ***

Follow Twitter Button

        Wait Until Element Is Visible    ${btn_Twitter}         30
        Click Element                    ${btn_Twitter}
Twitter New Window
            Select Window    New
            Maximize Browser Window

Input Text Username
            [Arguments]    ${input_username_twitter}
            Wait Until Element Is Visible    ${input_username_twitter}      30
            Input Text                       ${input_username_twitter}      one

Input Text Password
          [Arguments]    ${input_password_twitter}
           Wait Until Element Is Visible    ${input_password_twitter}      30
           Input Text                       ${input_password_twitter}      two

Check String
            [Arguments]    ${LOCATORS}    ${EXPECTED_VALUES}
        FOR    ${locator}    ${expected}    IN ZIP    ${LOCATORS}    ${EXPECTED_VALUES}
                Textfield Value Should Be     ${locator}    ${expected}
        END
