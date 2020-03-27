*** Settings ***
Resource    ../includes.robot
*** Keywords ***
Setup
    [Documentation]    Execute Before each Test Case - set browser
    ...    Default Browser is Chrome if Browser name not passed from command
    ...    Maximize Browser Window
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
TearDown
    [Documentation]    Execute After Test Case - to close browser
    Close Browser    
