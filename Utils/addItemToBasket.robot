*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/Resources.robot

*** Variables ***
${checkout}         //span[normalize-space()='Checkout']
${addToBasket}      (//button[@aria-label='Add to Basket'])
${countofAddToBasket}

*** Keywords ***
Add Item(s) To Basket
    [Arguments]             ${numberofitems}
    WAIT UNTIL PAGE CONTAINS ELEMENT        ${addtobasket}

    ${countofAddToBaskets}    get webelements     ${addtobasket}

    FOR      ${countofAddToBasket}   IN RANGE        ${numberofitems}
    Wait and Click     ${countofAddToBaskets[${countofAddToBasket}]}
    END

    Move To Cart
    PAGE SHOULD CONTAIN ELEMENT   ${checkout}
    Log To Console And Capture Screenshot   " ${numberofitems} Item(s) Added Successfully."


