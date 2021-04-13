*** Settings ***
Library  SeleniumLibrary
Library     DataDriver      file=DataDriver.xlsx    sheet_name=InformationData


*** Variables ***


#${click_date} =                //a[text()= '18']
${click_date_1} =               //a[text()= '
${click_date_2} =               ']
${month_XPATH_1} =              //span[@class='ui-datepicker-month' and contains(text(), '
${month_XPATH_2} =              ')]
${year_XPATH_1} =               //span[@class='ui-datepicker-year' and contains(text(), '
${year_XPATH_2} =               ')]
${btn_Next_XPATH} =             //a[@title="Next"]
#${input_Date} =                datepicker
${iframe_XPATH} =               //iframe[@data-src="../../demoSite/practice/datepicker/icon-trigger.html"]
${icon_calendar_XPATH} =        //img[@class='ui-datepicker-trigger'and @title='Select date']
${tab_iconTrigger_XPATH} =      //ul[@class='resp-tabs-list ']//child::li[@id='Icon Trigger']
${tab_dropDown_XPATH} =         //ul[@class='resp-tabs-list ']//child::li[@id='DropDown DatePicker']
${iframe_drop_down_XPATH} =     //iframe[@data-src="../../demoSite/practice/datepicker/dropdown-month-year.html"]
${input_datepicker_XPATH} =     //input[@id='datepicker']
${month_dropdown_XPATH} =       //select[@data-handler='selectMonth']
${year_dropdown_XPATH} =        //select[@data-handler='selectYear']
${day_XPATH_1} =                //a[text()='
${day_XPATH_2} =                ']
${btn_Next_Path_1} =            //a[@data-handler="next"]


${fb_email_XPATH} =             //input[@id='email']
${file_upload_XPATH} =          //input[@type='file' and @id='js-file-input']
${demo_link_XPATH} =            //a[@href="/demo.html"]

${btn_Create_User} =            //button[@id='create-user']
${iframe_Create_User} =         //iframe[@data-src="../../demoSite/practice/dialog/modal-form.html"]
${input_Name} =                 //input[@id='name']
${input_Email} =                //input[@id='email']
${input_Password} =             //input[@id='password']
${btn_Create_account} =         //button[text()='Create an account']

${dropdown_entries} =           //select[@aria-controls='example']
${th_asc} =                     //th[@class='sorting_asc']
${th_desc} =                    //th[@class='sorting_desc']
${btn_Next} =                   //a[@class='paginate_button next']
${data_Search} =                //td[@data-search='Yuri Berry']
${input_Search} =               //input[@type="search"]
${btn_Prev} =                   //a[@class='paginate_button previous']
${pagination_size} =            //div[@id='example_paginate' ]//a[@aria-controls='example']

${btn_Twitter} =                //a[@href="https://twitter.com/intent/follow?screen_name=seleniumeasy"]
${input_username_twitter} =     //input[@name="session[username_or_email]"]
${input_password_twitter} =     //input[@name="session[password]"]

${input_fname} =                //input[@name='first_name']
${input_lname} =                //input[@name='last_name']


${username_XPATH}=                  //input[@id='ctl00_CPHContainer_txtUserLogin']
${password_XPATH}=                  //input[@id='ctl00_CPHContainer_txtPassword']
${btn_Login_XPATH} =                //input[@type='submit' and @id='ctl00_CPHContainer_btnLoginn']

${listbox_XPATH} =                  //div[@class='dual-list list-left col-md-5']
${lb_data} =                        //li[text()='
${lb_extend} =                      ']

*** Keywords ***



#${start_Date} =     //div[@class='xp__dates-inner xp__dates__checkin']
#${click_Date} =     //td[@data-date='2021-12-10']
#${current_Date_XPATH} =  //td[@class='bui-calendar__date bui-calendar__date--today']
#${btn_nextDate} =   //div[@class='bui-calendar__control bui-calendar__control--next']
#${class_disabled} =     bui-calendar__date--disabled





# Crizel Changes
#${frame_tbl} =  //iframe[@class='preview-iframe']
#${rows} =       //table[@id='myTable']/tbody/tr
#${col} =        //table[@id='myTable']/tbody/tr[1]/td
#${input_row} =  //input[@name='name']
#${input_row_email} =    //input[@name='mail']
#${input_row_phone} =    //input[@name='phone']
#${btn_add} =    addrow
#${add_Row} =    //button[@class='btn btn-info add-new' and contains(text() , 'Add New')]


#${header_XPATH} =   menuButton
#${iFrame_XPATH} =          //iframe[@id='iframeResult']
#${js_XPATH} =              //button[@onclick='myFunction()']
#${inputSearchXpath} =      //input[@id='q']
#${signup_XPATH} =          //a[@href='//member.lazada.com.ph/user/register']
#${select_month_XPATH} =    //span[@id='month']
#${select_month_value} =    //ul[@class='next-menu-content']//child::li[text() = 'December']
#${select_day_XPATH} =      //span[@id='day']
#${select_day_value} =      //ul[@class='next-menu-content']//child::li[text() = '02']
#${checked_XPATH} =         //input[@aria-checked='true']
#${unselect_chk_XPATH} =    //input[@id='enableSmsNewsletter']
#${moveout_XPATH} =         //span[@id='nc_2_n1z']
#${inputSearch} =            Bag
#${buttonSearch_XPATH} =     //button[@class='search-box__button--1oH7']
#${btnaddTocart_XPATH} =     //a[@href='//cart.lazada.com.ph/cart?scm=1003.4.icms-zebra-5001425-2591744.OTHER_5196131796_2267419']