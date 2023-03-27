*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/Resources.robot
Resource  ../../Utilities/clearData.robot


*** Variables ***
${locator}              //button[@class='mat-focus-indicator mat-icon-button mat-button-base']
${clickelement}         (//button[@class='mat-focus-indicator mat-icon-button mat-button-base'])[1]


*** Keywords ***
Clear Cart              #Uses another keyword to check if any existing cart items are present to be deleted
        sleep                                       0.5s
        Clear Exisitng Data                         ${locator}      ${clickelement}
        WAIT UNTIL PAGE DOES NOT CONTAIN            ${locator}
        Log To Console And Capture Screenshot       "All Cart Items Deleted."



