*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/removeItemsFromBasket.robot
Resource  ../../Utilities/clearAddressBook.robot

*** Variables ***
${deleteButton}         //button[@class='mat-focus-indicator mat-icon-button mat-button-base']

*** Keywords ***
Skip If Empty               #Runs a certains keyword if the condition is met, here checks for delete button is present
    [Arguments]  ${KeywordName}
        sleep       0.5s
        ${IsElementVisible}=    Run Keyword And Return Status    Element Should Be Visible   ${deleteButton}
        Run Keyword If          ${IsElementVisible}  ${KeywordName}
        ...  ELSE               Log To Console   "Section Is Empty. No items to clear."
        Return Home
