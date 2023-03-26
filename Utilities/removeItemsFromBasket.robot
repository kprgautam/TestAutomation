*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/Resources.robot
Resource  ../../Utilities/clearData.robot


*** Variables ***
${locator}              //button[@class='mat-focus-indicator mat-icon-button mat-button-base']
${i}
${clickelement}         (//button[@class='mat-focus-indicator mat-icon-button mat-button-base'])[1]
${headerbutton}         //span[@class='mat-button-wrapper']//span[contains(text(),'OWASP Juice Shop')]
${basket}               //span[normalize-space()='Your Basket']


*** Keywords ***
Clear Cart              #Uses another keyword to check if any existing cart items are present to be deleted
        sleep                                       0.5s
        Clear Exisitng Data                         ${locator}      ${clickelement}     ${i}
        page should not contain element             ${locator}
        Log To Console And Capture Screenshot       "All Cart Items Deleted."



