*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                https://www.amazon.com
${SEARCH_INPUT}       id=twotabsearchtextbox
${SEARCH_BUTTON}      id=nav-search-submit-button
${RESULT_ITEM}        xpath=//div[@data-component-type='s-search-result']

*** Keywords ***
Open Amazon Page
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    
Input Search Query
    [Arguments]    ${query}
    Input Text    ${SEARCH_INPUT}    ${query}
    
Submit Search
    Click Button    ${SEARCH_BUTTON}

Results Should Be Visible
    Wait Until Page Contains Element    ${RESULT_ITEM}    timeout=10s
    
Close Browser Window
    Close Browser