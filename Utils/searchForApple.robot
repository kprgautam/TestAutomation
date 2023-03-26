*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/Resources.robot

*** Variables ***
${searchButton}     //mat-icon[normalize-space()='search']

*** Keywords ***
Search For
    [Arguments]  ${itemName}
    Wait and Click          ${searchButton}
    PRESS KEYS              ${None}     ${itemName}
    PRESS KEYS              ${None}     ENTER

