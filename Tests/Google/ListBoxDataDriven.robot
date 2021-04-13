*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library     Collections
#Library     DataDriver      file=DataDriver.xls    sheet_name=ListBoxTest
Resource   ../../Resources/Keywords.robot
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot


Suite Setup     StartTestCase
Test Setup      Visit Url

*** Variables ***

*** Test Cases ***

Select on List Box
        List Box

*** Keywords ***

List Box
        Open Excel Document   filename=${EXEC_DIR}\\DataDriver.xlsx    doc_id=doc1
        Wait Until Element Is Visible    ${listbox_XPATH}       30
        ${select_data_1} =      Read Excel Cell    row_num=2        col_num=1       sheet_name=ListBoxTest
        ${select_data_2} =      Read Excel Cell    row_num=2        col_num=2       sheet_name=ListBoxTest
        ${select_data_3} =      Read Excel Cell    row_num=2        col_num=3       sheet_name=ListBoxTest
        log to console    ${select_data_1}
        ${select_data1_XPATH}    Catenate    ${lb_data}${select_data_1}${lb_extend}
        ${select_data2_XPATH}    Catenate    ${lb_data}${select_data_2}${lb_extend}
        ${select_data3_XPATH}    Catenate    ${lb_data}${select_data_3}${lb_extend}
        Click Element    ${select_data1_XPATH}
        Click Element    ${select_data2_XPATH}
        Click Element    ${select_data3_XPATH}



#Select from list by label and validate
#    [Arguments]    ${locator}      ${select value}
#    Focus   ${locator}
#    # Select from list by label
#    Select From List By Label   ${locator}  ${select value}
#    # Get selected value and validate it against passed value as argument
#    ${value} =  Get Selected List Label ${locator}
#    Should be equal ${select value} ${value}


#@{Elements}=    Get WebElements    ${AllElements}
#:FOR    ${EachElement}    in    @{Elements}
#\    Get Text    ${EachElement}