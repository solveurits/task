*** Settings ***
Resource    ../includes.robot

*** Keywords ***
Select the Tag
    [Arguments]    ${tag}
    [Documentation]    Select the tag from home page & display list of articles based on filter applied
    ${selectLocator}    Replace String    ${SELECT TAG}    tags    ${tag}
    ${activeLocator}    Replace String    ${TAG ACTIVE}    tags    ${tag}    
    Wait Until Element Is Visible    ${selectLocator}    
    Click Element    ${selectLocator}
    Wait Until Page Contains Element    ${activeLocator} 
    
Navigate to Global Feed
    Wait Until Element Is Visible    ${GLOBAL FEED TAB}    ${MEDIUM_WAIT}
    Click Element    ${GLOBAL FEED TAB} 
    
Navigate to New Article
    Wait Until Element Is Visible    ${NEW ARTICLE}    ${MEDIUM_WAIT}
    Click Element    ${NEW ARTICLE} 
    
Navigate to Home
    Wait Until Element Is Visible    ${HOME}    ${MEDIUM_WAIT}
    Click Element    ${HOME}    
    
ARTICLE Fill Value to create New Article  
    [Arguments]    ${title}    ${description}    ${body}    ${tags}
    [Documentation]    Create New Article - Enters title, description, body and tags as per the parameter value received
    Wait Until Element Is Visible    ${ARTICLE TITLE}    ${MEDIUM_WAIT}
    Input Text    ${ARTICLE TITLE}    ${title}    
    Input Text    ${ARTICLE DESCRIPTION}    ${description}    
    Input Text    ${ARTICLE BODY}    ${body}    
    Input Text    ${ARTICLE TAGS}    ${tags} 
    Press Keys    ${ARTICLE TAGS}    ENTER
    
ARTICLE Click Publish Article
    Wait Until Element Is Visible    ${PUBLISH ARTICLE}    ${MINIMUM_WAIT}
    Click Element    ${PUBLISH ARTICLE}
    Wait Until Page Does Not Contain Element    ${PUBLISH ARTICLE}    
    
GLOBAL FEED Verify Article Created Detail
    [Arguments]    ${title}    ${description}    ${user}
    [Documentation]    Verify Article created as expected with data - list of articles in home page
    ${titleLocator}    Replace String    ${ARTICLE TITLE DETAIL}    user    ${user}
    ${descLocator}    Replace String    ${ARTICLE DESCRIPTION DETAIL}    user    ${user}    
    Wait Until Element Is Visible    ${titleLocator}    ${MEDIUM_WAIT}
    Element Text Should Be    ${titleLocator}    ${title}    
    Element Text Should Be    ${descLocator}    ${description}    
    
    
    