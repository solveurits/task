*** Settings ***

Test Setup    Setup
Test Teardown    TearDown
Resource    ../includes.robot

*** Test Cases ***
Story1    
    Story1 Conduit SignUp

Story2
    Story2 Select Tag
    
Story3
    Story3 Create New Article
    
*** Keywords ***
Story1 Conduit SignUp
    [Documentation]    As a visitor to the Conduit web site, I should be able to sign up 
    ...    for an account when I visit the Conduit home page
    ...    I should not be able to sign up unless I enter valid data

    # Field Validation with Invalid Data
    Generate User Test Data & Set Suite Variable
    Navigate To SignUp
    SignUp Verify Error Message with Invalid Data
    
    # Signup With Valid Data
    SignUp Fill Values to create account    ${username}    ${email}    ${password}
    SignUp Click SignUp Button

    # Verify SignUp Success
    Wait Until Element Is Visible    ${GLOBAL FEED TAB}    ${MEDIUM_WAIT}
    Logout Application
       

Story2 Select Tag
    [Documentation]    As a visitor to the Conduit web site, I should be able to view articles that interest me by selecting
    ...    a tag. Once a tag is selected, I should be able to select a different tag to view different articles.

    Navigate To SignIn
    SignIn Fill Values to login    autotest123@email.com    autotest123
    SignIn Click SignIn Button
    Wait Until Element Is Visible    ${GLOBAL FEED TAB}    ${MEDIUM_WAIT}
    Select the Tag    test
    Wait Until Page Contains Element    ${ARTICLE LIST}    ${MEDIUM_WAIT} 
    Select the Tag    cars
    Wait Until Page Contains Element    ${ARTICLE LIST}    ${MEDIUM_WAIT}    
    Select the Tag    flowers
    Wait Until Page Contains Element    ${ARTICLE LIST}    ${MEDIUM_WAIT}
    Logout Application   

Story3 Create New Article
    [Documentation]    As a logged in user to the Conduit web site, I should be able to create an article and see it in the
    ...    global feed. (Note: currently "Your Feed" doesn't seem to work for this web site, so just focus on
    ...    the Global Feed for this exercise.)

    Navigate To SignIn
    SignIn Fill Values to login    autotest123@email.com    autotest123
    SignIn Click SignIn Button
    ${title}    Set Variable    Healthy Eating
    ${description}    Set Variable    The Importance of Environment for Healthy Eating
    ${body}    Set Variable    This study secretly took place in the hospital cafeteria and helped thousands of people develop healthy eating habits
    ${tags}    Set Variable    test
    Navigate to New Article
    ARTICLE Fill Value to create New Article    ${title}    ${description}    ${body}    ${tags}   
    ARTICLE Click Publish Article
    Navigate to Home
    Navigate to Global Feed
    GLOBAL FEED Verify Article Created Detail    ${title}    ${description}    autotest123     
    Logout Application       

Generate User Test Data & Set Suite Variable
    [Documentation]    Generate Dynamic username, email and password and set variable accross suite.
    ...                It can be used in any test case.
    ${username}    Generate Random String    6    LETTERS][NUMBERS]
    ${username}    Set Variable  txtest1_${username}
    ${email}    Set Variable    ${username}@gmail.com
    ${password}    Generate Random String    8    [LETTERS][NUMBERS]
    Set Suite Variable    ${username}
    Set Suite Variable    ${email}
    Set Suite Variable    ${password}
    
SignUp Verify Error Message with Invalid Data 
    [Documentation]    SignUp with 3 Invalid Data Scenerio
    ...    1. Invalid Email and Password, username already exist
    ...    2. Invalid Email and username already exist
    ...    3. Existing Email
    # 1. Verify Error Message for Invalid Input (Email, Password, Username)
    SignUp Fill Values to create account    tt    tt    tt
    SignUp Click SignUp Button
    Verify Error Message    email is invalid
    Verify Error Message    password is too short (minimum is 8 characters)
    Verify Error Message    username has already been taken
    
    # 2. Verify Error Message for Invalid Input (Email, Username)
    SignUp Fill Values to create account    txtest123    tt    txtest123
    SignUp Click SignUp Button
    Verify Error Message    email is invalid
    Verify Error Message    username has already been taken
 
    # 3. Verify Error Message for Invalid Input (Email)
    SignUp Fill Values to create account    txtest12345    txtest123@example.com     txtest123
    SignUp Click SignUp Button
    Verify Error Message    email has already been taken
