*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/Resources.robot

*** Variables ***
${checkout}     //span[normalize-space()='Checkout']
${assert}       //span[normalize-space()='Add New Address']

*** Keywords ***
Click Checkout
    WAIT UNTIL ELEMENT IS ENABLED       ${checkout}
    Wait and Click                      ${checkout}
    WAIT UNTIL ELEMENT IS ENABLED         ${assert}
    Log To Console And Capture Screenshot  "Checkout Complete."

