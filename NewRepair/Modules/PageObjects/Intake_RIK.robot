*** Settings ***
Library                         SeleniumLibrary
Library                         String
Variables                       Data.py

*** Keywords ***
Create Intake Repair-In-Kind
     Start new intake
     Fill in General information
     Fill in person information
     Fill in Policy  
     Document upload        ${CURDIR}/${DocImagePath}      PNG
     Fill in damage info
     Planning
     Summary
     Request complete
     Check dossiers     
Start new intake
     Maximize browser window  
     Click element    xpath=/html/body/app-root/app-dashboard/div/main/div/ng-component/div/div/app-menu-stepper/div/div/div/kendo-panelbar[1]/kendo-panelbar-item/span/span
     Sleep    5
     Page should contain  Intake
     Click element    xpath=/html/body/app-root/app-dashboard/div/main/div/ng-component/div/div/app-menu-stepper/div/div/div/kendo-panelbar[1]/kendo-panelbar-item/div/div/kendo-panelbar-item[1]/span
     Sleep    5
Fill in General information
     Click element                               //span[@class='k-icon k-i-arrow-s']  #{Client_list}
     Sleep   5                                    
     Mouse Down                                  xpath=//li[text()='Wormer Wonen']
     Click Element                               xpath=//li[text()='Wormer Wonen']   
     Sleep   5                                     
     Click element  //span[normalize-space()='Repair in kind - Single repair']
     Click element  //button[normalize-space()='Proceed']
Fill in person information
     Input text  //input[@placeholder='Postal Code']      3068LM 
     Input text  //input[@placeholder='House Number']      18
     sleep  3
     Click element  //input[@id='female']
     input text     //input[@placeholder='First name duped']    Rafika
     input text     //input[@placeholder='Surname duped']       Demni_auto RIK
     Sleep    2    
     Click button  //button[normalize-space()='Proceed']
     sleep            3
     Page should contain       Policy info
Fill in Policy
    #Click element     //kendo-panelbar-item[@role='treeitem']//span//span
    input text     //input[@placeholder='Policy Nr']    1008
    wait until page contains element        (//input[@placeholder='Damage Nr'])[1]
    Input text    (//input[@placeholder='Damage Nr'])[1]   1009
    click element     xpath=/html/body/app-root/app-dashboard/div/main/div/app-new-intake/div/div/div/app-policy-info/div/div[2]/div/div[1]/form/div[2]/div/kendo-panelbar/kendo-panelbar-item/div/div/app-policy-detail/div/kendo-card[3]/kendo-card-body/div/div[1]/input
    Click button  (//button[normalize-space()='Proceed'])[1]
    sleep            2
    Page should contain       Document & photo upload  
Document upload
    [Arguments]                           ${doc_path}                            ${doc_type} 
    Click element    //div[@aria-label='Select files...']   #//input[@name='files']
    Sleep    1
    Choose file     //input[@name='files']        ${doc_path}
    #Click Element  id:file-submit
    Sleep    2
    Click button  (//button[normalize-space()='Proceed'])[1]
    Sleep    2
    Page should contain       Damage info    
Fill in damage info
    Click element    //span[@class='k-icon k-i-calendar']
    wait until page contains element    //kendo-popup[@class='k-animation-container k-animation-container-shown']
    Click element   //kendo-popup[@class='k-animation-container k-animation-container-shown']
    #wait until page contains element    //span[@class='k-today']
    #Click element    //span[@class='k-today']
    sleep     3
    wait until page contains element    (//input[@role='combobox'])[1]
    #input text    (//input[@role='combobox'])[1]    Fire
    Click element                               (//span[@class='k-select'])[2]    #{causeInput}
    sleep                                       3
    Mouse Down                                  xpath=//li[text()='Water']
    Click Element                               xpath=//li[text()='Water']   #xpath=//li[contains(.,'Fire')]
    click element     //input[@id='inftwoyears']
    input text     (//input[@role='combobox'])[2]     Leakage from devices connected to piping
    Sleep    2
    click element    //div[@formarrayname='damageInformations']
    sleep    2
    input text    (//input[@role='combobox'])[3]    Washing machine
    sleep    2
    input text     (//input[@role='combobox'])[4]    Flat / apartment
    #Click element    //div[@class='intake-extra-info']
    #Click element    //div[contains(text(),'Add new damage situation')]
    Sleep    3
    input text     //kendo-combobox[@formcontrolname='location']//input[@role='combobox']    Annex
    Sleep    3
    wait until page contains element    //kendo-combobox[@formcontrolname='object']//input[@role='combobox']      
    Click element    //kendo-combobox[@formcontrolname='object']//span[@class='k-icon k-i-arrow-s']
    Sleep    3
    Mouse Down                                  xpath=//li[text()='Drainpipes']
    Click Element                               xpath=//li[text()='Drainpipes']   #xpath=//li[contains(.,'Fire')]
    input text    //kendo-combobox[@formcontrolname='damageType']//input[@role='combobox']   Shattered
    Sleep    2
    input text    //kendo-combobox[@formcontrolname='materialCategory']//input[@role='combobox']    Various
    click element    //div[@formarrayname='damageInformations']
    Sleep    3
    input text    (//input[@role='combobox'])[10]    Wood 
    click element    //div[@formarrayname='damageInformations']
    click element    //input[@value='light']
    #Click element     //input[@type='checkbox']
    sleep    2
    Click button  (//button[normalize-space()='Proceed'])[1]
    Sleep            6
    Page should contain       Planning

Planning
    wait until page contains element    //button[normalize-space()='Plan']
    Click button    //button[normalize-space()='Plan']
    Sleep    2
    Click element    //h6[normalize-space()='AB Lekdetectie']
    Click element    //button[normalize-space()='Save']
    Sleep    1
    Click button      (//button[normalize-space()='Proceed'])[1]
    Page should contain    Summary
Summary
    Click button     //button[normalize-space()='Finish']
Request complete
    #wait until page contains element     (//button[@primary='true'])[1] 
    Wait until element is Visible        (//button[@primary='true'])[1]
    Click Button    (//button[@primary='true'])[1] 
Check dossiers
    Sleep  5
    Page should contain    Dossiers 