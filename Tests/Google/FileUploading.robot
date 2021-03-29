*** Settings ***
Library    SeleniumLibrary
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Locator.robot
Resource   ../../Resources/Common.robot


Suite Setup          Start TestCase
Test Template        Upload File
#Suite Teardown      Close Browser

*** Test Cases ***
Validate the the user was able to upload file
    Upload File

*** Keywords ***


