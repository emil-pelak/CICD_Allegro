*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Take Screenshot If Test Fails
    Run Keyword If Test Failed    Capture Page Screenshot
