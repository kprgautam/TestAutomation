*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/removeItemsFromBasket.robot
Resource  ../../Utils/clearAddressBook.robot

*** Variables ***
${deleteButton}         //button[@class='mat-focus-indicator mat-icon-button mat-button-base']

*** Keywords ***
Skip If Empty
    [Arguments]  ${KeywordName}
        sleep       0.5s
        ${IsElementVisible}=    Run Keyword And Return Status    Element Should Be Visible   ${deleteButton}
        Run Keyword If          ${IsElementVisible}  ${KeywordName}
        ...  ELSE               Log To Console   "Section Is Empty. No items to clear."
        Return Home

