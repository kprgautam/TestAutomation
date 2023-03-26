*** Settings ***
Library     Selenium2Library

*** Variables ***
${assertElement}    //span[normalize-space()='Pay using wallet']

*** Keywords ***
Select Delivery         #Selects desired delivery
    Wait and Click      //mat-row[1]//mat-cell[1]
    Wait and Click      //span[normalize-space()='Continue']
    page should contain element  ${assertElement}
    Log To Console And Capture Screenshot     "Delivery Selected Successfully".

