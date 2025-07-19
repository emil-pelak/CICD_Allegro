*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${AMAZON_URL}         https://www.amazon.com
${SEARCH_BAR}         id=twotabsearchtextbox
${SEARCH_BUTTON}      id=nav-search-submit-button
${SEARCH_RESULTS}     css=.s-search-results

*** Keywords ***
Open Amazon Page
    Open Browser    ${AMAZON_URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${SEARCH_BAR}    3s

Input Search Query
    [Arguments]    ${query}
    Wait Until Element Is Visible    ${SEARCH_BAR}    3s
    Clear Element Text    ${SEARCH_BAR}
    Input Text    ${SEARCH_BAR}    ${query}
    Sleep    1s

Submit Search
    Click Button    ${SEARCH_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_RESULTS}    3s

Results Should Be Visible
    Element Should Be Visible    ${SEARCH_RESULTS}

Close Browser Window
    Close Browser