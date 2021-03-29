*** Settings ***
Documentation    Read CSV Sheet
Library     SeleniumLibrary
#Library     ExcelLibrary
Library     ../../Library/checkfile.py
Library     ../../Library/Check_Rows.py
#Library     ../../Library/ReadCsvFiles.py
Library     CSVLib
Library     Collections
Library     String
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot


#Suite Setup         Start TestCase
#Test Template       ReadCSV
#Suite Teardown      Close Browser

*** Variables ***


*** Test Cases ***
Test
    Check row column
    Search String
Csv Lengths
    Reading a csv file

*** Keywords ***
Check row column
    ${result} =    go_to_nth_row_nth_column    TestDataCSV.csv    2     0
#    log to console    ${result}

Search String
    ${result1}=    search_cell    TestDataCSV.csv       Crizel
#    log to console  ${result1}

    Run Keyword If    ${result1}    Log To Console    variable exist
    Run Keyword If    not ${result1}    Log To Console    variable not exist

Reading a csv file

    ${data} =  go_to_nth_row_nth_column    TestDataCSV.csv    3     3
    @{LIST} =  Create List  ${data}
    log to console     @{LIST}


