*** Settings ***
Resource              ${EXECDIR}/Modules/PageObjects/Common.robot
Resource              ${EXECDIR}/Modules/PageObjects/Intake.robot

*** Test Cases ***
TC_Create Intake 
    [Tags]                                    Smoke
    Start Application Local
    Set up language profile
    Create Intake
    [Teardown]     Close test browsers