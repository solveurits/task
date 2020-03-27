*** Settings ***
Resource    ../includes.robot

*** Keywords ***
Navigate To SignUp
    [Documentation]    Navigate to SignUp Page
    Wait Until Element Is Visible    ${SIGNUP MENU}    ${MEDIUM_WAIT}
    Click Link    ${SIGNUP MENU}    

Navigate To SignIn
    [Documentation]    Navigate to SignIn Page
    Wait Until Element Is Visible    ${SIGNIN MENU}    ${MEDIUM_WAIT}
    Click Link    ${SIGNIN MENU}    

SignUp Fill Values to create account
    [Arguments]    ${username}    ${email}    ${password}
    [Documentation]    Fill all SignUp Value
    Wait Until Element Is Visible    ${SIGNUP USERNAME}    ${MEDIUM_WAIT}
    Input Text    ${SIGNUP USERNAME}    ${username}    
    Input Text    ${SIGNUP EMAIL}    ${email}    
    Input Text    ${SIGNUP PASSWORD}    ${password}    
        
SignUp Click SignUp Button
    [Documentation]    Click on SignUp data after all required data entered
    Wait Until Element Is Enabled    ${SIGNUP}    ${MINIMUM_WAIT}
    Click Button    ${SIGNUP}    

SignIn Fill Values to login
    [Arguments]    ${email}    ${password}
    [Documentation]    Enter email and password to login into application
    Wait Until Element Is Visible    ${SIGNUP EMAIL}    ${MEDIUM_WAIT}
    Input Text    ${SIGNUP EMAIL}    ${email}    
    Input Text    ${SIGNUP PASSWORD}    ${password}    
    
SignIn Click SignIn Button
    [Documentation]    Click on SignIn data after all required data entered
    Wait Until Element Is Enabled    ${SIGNIN}    ${MINIMUM_WAIT}
    Click Button    ${SIGNIN}    

Verify Error Message
    [Arguments]    ${message}
    [Documentation]    Verify error message while SignUp
    ...    Parameter:- Message
    Wait Until Element Is Visible    //app-list-errors//li[normalize-space()='${message}']
    
Logout Application
    [Documentation]    Logout Application
    Wait Until Element Is Visible    ${SETTINGS}    
    Click Element    ${SETTINGS}
    Wait Until Element Is Visible    ${LOGOUT}    ${MEDIUM_WAIT}
    Click Element    ${LOGOUT}
    