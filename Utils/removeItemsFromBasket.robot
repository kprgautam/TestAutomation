*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/Resources.robot
Resource  ../../Utils/clearData.robot


*** Variables ***
${locator}              //button[@class='mat-focus-indicator mat-icon-button mat-button-base']
${i}
${clickelement}         (//button[@class='mat-focus-indicator mat-icon-button mat-button-base'])[1]
${headerbutton}         //span[@class='mat-button-wrapper']//span[contains(text(),'OWASP Juice Shop')]
${basket}               //span[normalize-space()='Your Basket']


*** Keywords ***
Clear Cart
        sleep                                       0.5s
        Clear Exisitng Data                         ${locator}      ${clickelement}     ${i}
        page should not contain element             ${locator}
        Log To Console And Capture Screenshot       "All Cart Items Deleted."
        Wait and Click                              ${headerbutton}





