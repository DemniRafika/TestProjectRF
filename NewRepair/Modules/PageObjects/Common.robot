*** Settings ***
Library                         SeleniumLibrary
Variables                       ${EXECDIR}/GlobalProperties.py


*** Keywords ***
Start Application Local
    Open Browser       ${Website_url}                   ${Browser}
    Sleep    5
    #Wait Until Element Is Visible    xpath=/html/body/app-root/app-dashboard/ng-component/div/div/div/div/div/div/div/div[1]/div/button
    Click Button                     //button[normalize-space()='CED medewerker']
    #Wait Until Element Is Enabled   //button[normalize-space()='CED medewerker']
    #Wait Until Keyword Succeeds    6x    1 sec   Click button     /html/body/app-root/app-dashboard/ng-component/div/div/div/div/div/div/div/div[1]/div/button
    Sleep  2
    Wait Until Keyword Succeeds    5x    0.5 sec  Click element        (//input[@id='i0116'])[1]
    Wait Until Keyword Succeeds    5x    0.5 sec    Input Text     (//input[@id='i0116'])[1]       dossiercoordinator-testrepair@ced.nl  #wait until page contains element      //input[@value='Suivant']
    Wait Until Keyword Succeeds   5x    0.5 sec    Click button   (//input[@id='idSIButton9'])[1]
    Sleep  3
    #wait until page contains element    //input[@placeholder='Password']
    Wait Until Keyword Succeeds   5x    0.5 sec    Input text     (//input[@id='i0118'])[1]        4fYo*|W4I(OuNQnWZ>U(
    Wait Until Keyword Succeeds   5x    0.5 sec    Click Button   (//input[@id='idSIButton9'])[1]
    Sleep  3
    wait until page contains element    (//input[@id='idSIButton9'])[1]
    Click button    (//input[@id='idSIButton9'])[1]
    Sleep    2
Set up language profile 
    Sleep  5
    Click element     //b[@class='hidden-xs desktop'] 
    wait until page contains element     //li[normalize-space()='Mijn profiel']
    click element     //li[normalize-space()='Mijn profiel']
    wait until page contains element     //button[normalize-space()='English']
    click element    //button[normalize-space()='English']
    click element    //button[normalize-space()='Dashboard']
    sleep   3
    Page should contain  Dashboard
Close test browsers    
     Close all browsers
         