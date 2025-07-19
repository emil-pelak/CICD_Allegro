*** Settings ***
Library     SeleniumLibrary
Resource    ../page_objects/AmazonPage.robot
Resource    ../keywords/BrowserUtils.robot

*** Test Cases ***
Search For Pendrive On Amazon
    Open Amazon Page
    Sleep    2s

    Input Search Query    Mouse
    Submit Search
    Results Should Be Visible
    Sleep    2s

    Input Search Query    Keyboard
    Submit Search
    Results Should Be Visible
    Sleep    2s
    
    Input Search Query    Display
    Submit Search
    Results Should Be Visible
    Sleep    2s

    Input Search Query    Laptop
    Submit Search
    Results Should Be Visible
    Sleep    2s

    Close Browser Window