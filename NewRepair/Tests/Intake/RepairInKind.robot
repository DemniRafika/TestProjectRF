*** Settings ***
Resource              ${EXECDIR}/Modules/PageObjects/Common.robot
Resource              ${EXECDIR}/Modules/PageObjects/Intake_RIK.robot

*** Test Cases ***
TC_Create Intake for repair in kind
    [Tags]                                    Smoke
    Start Application Local
    Set up language profile
    Create Intake Repair-In-Kind
    [Teardown]     Close test browsers