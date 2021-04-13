*** Settings ***
Library     SeleniumLibrary
Resource   ../../Resources/Common.robot
Resource   ../../Resources/Locator.robot


*** Keywords ***
Start TestCase
    Open Browser  ${EMPTY}    ${Browser}
    Maximize Browser Window
Visit Url
    Go To    ${URL}
Select Tab Drop Down
    Click Element    ${tab_dropDown_XPATH}

Click the input picker
    Select Frame     ${iframe_drop_down_XPATH}
    Wait Until Element Is Visible    ${input_datepicker_XPATH}  20
    Click Element    ${input_datepicker_XPATH}

Select Month Dropdown
    [Arguments]    ${MONTHS}
    Click Element    ${month_dropdown_XPATH}
    Select From List By Label    ${month_dropdown_XPATH}    ${MONTHS}

Select Years Dropdown
    [Arguments]    ${YEARS}
     Click Element    ${year_dropdown_XPATH}
     Select From List By Label    ${year_dropdown_XPATH}    ${YEARS}

Select Day of the year
         [Arguments]    ${day_XPATH}
#         Click Element      ${date}
      FOR    ${Index}    IN RANGE    1   50
          ${isElementExist} =  Run Keyword And Return Status     Element Should Be Visible      ${day_XPATH}
          ${Month_Exist} =     Run Keyword And Return Status     Element Should Be Visible      ${month_dropdown_XPATH}
          ${Year_Exist} =      Run Keyword And Return Status     Element Should Be Visible      ${year_dropdown_XPATH}
          Run Keyword If    ${Month_Exist} and ${Year_Exist}   Click Element     ${day_XPATH}
          ...       ELSE
          ...       Click Element    ${btn_Next_Path_1}
          Exit For Loop If    ${Month_Exist} and ${Year_Exist}
      END

Upload File
        Wait Until Element Is Visible    ${demo_link_XPATH}       30
        Choose File    ${file_upload_XPATH}         D:/Documents/ATTENDANCE_ENGLISH.xlsx

Sort Table via Name Ascending
        Wait Until Element Is Visible    ${th_asc}          30
        Click Element                    ${th_asc}

Sort Table via Name Descending
        Wait Until Element Is Visible    ${th_desc}        30
        Click Element                    ${th_desc}


#ExcelSheet_Data
#    [Arguments]    ${NAME_PLACE}
#    Wait until element is visible       ${search_XPATH}     30
#    Input Text    ${search_XPATH}       ${NAME_PLACE}

#Check Attributes
#TC DateTimePicker

#     Wait Until Element Is Visible     ${start_Date}    30
#     Click Element     ${start_Date}
#
#      FOR    ${Index}    IN RANGE    1   31
#          ${isElementExist} =  Run Keyword And Return Status     Element Should Be Visible      ${click_Date}
#          Log To Console    ${isElementExist}
#          ${check_element} =   Run Keyword And Return Status   Should Not Contain       ${click_Date}         ${class_disabled}
#
#          Run Keyword If     ${isElementExist}      Click Element    ${click_Date}
#                ...         ELSE
#                ...         Click Element      ${btn_nextDate}
#          Exit For Loop If    ${isElementExist}
#      END

#            ${test_name} =    get element attribute    ${click_Date}    class
#            Should not contain        ${test_name}            ${class_disabled}
#            Element Should Be Visible    ${click_Date}
#            Click Element    ${click_Date}
#            Run Keyword If   ${isElementExist}      Click Element    ${click_Date}
#            ...         ELSE
#            ...         Click Element    ${btn_nextDate}



#TC Tables Add Row
#    Wait Until Element Is Visible      ${frame_tbl}     30
#    Select Frame                       ${frame_tbl}
#    ${rows}     Get Element Count      ${rows}
#    log to console                     ${rows}
#    ${col}      Get Element Count      ${col}
#    log to console                     ${col}
#
#
#    [Arguments]    ${list}
#    ${length} =    Get Length    ${list}
#    log to console    ${length}
#    FOR     ${i}    IN RANGE    ${length-1}
#
#        ${first}=    Set Variable    ${list}[0]
#        ${second}=   Set Variable    ${list}[1]
#        ${third}=    Set Variable    ${list}[2]
#        Click Element    ${btn_add}
#    END
#
#        Input Text        ${input_row}            ${first}
#        Input Text        ${input_row_email}      ${second}
#        Input Text        ${input_row_phone}      ${third}
#        log to console    ${first}

#     FOR    ${rows}  IN RANGE    ${col}
##        Input Text      ${input_row}     ${first}
##        Click Element    ${btn_add}
##        log to console  ${col}.${rows}
#     END




#    Wait Until Element Is Visible      ${add_Row}       10
#    Click Element                      ${add_Row}


#JavascriptSampleTc
#        Wait Until Element Is Visible    ${iFrame_XPATH}      30
#        Select Frame            ${iFrame_XPATH}
#        Click Element           ${js_XPATH}
#        Handle Alert            ACCEPT
#        Log                     ${js_XPATH}


#Click Sign Up
#        Wait Until Element Is Visible    ${signup_XPATH}    30
#        Click Element                    ${signup_XPATH}
#        Wait Until Element Is Visible    ${select_month_XPATH}     30
#        Click Element                    ${select_month_XPATH}
#        Wait Until Element Is Visible    ${select_month_value}     1
#        Click Element                    ${select_month_value}
#        Click Element                    ${select_day_XPATH}
#        Wait Until Element Is Visible    ${select_day_value}     1
#        Click Element                    ${select_day_value}
#        ${Is_Checkbox_Selected} =    Run Keyword And Return Status    Unselect Checkbox    ${checked_XPATH}




#Verify SearchText
#      Wait Until Element Is Visible    ${inputSearchXpath}    30
#      Input Text        ${inputSearchXpath}    ${inputSearch}
#      Click Element     ${buttonSearch_XPATH}

#Finish TestCase
#    Close browser