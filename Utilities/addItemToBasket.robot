*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/Resources.robot

*** Variables ***
${checkout}             //span[normalize-space()='Checkout']
${addToBasket}          (//button[@aria-label='Add to Basket'])
${countofAddToBasket}
${assert}               //span[normalize-space()='Add New Address']
${numberofItemsInCart}  //button[@class="mat-focus-indicator mat-icon-button mat-button-base"]

*** Keywords ***
Add Item(s) To Cart
    [Arguments]             ${numberofitems}                 #Pass the number of items to be added
    WAIT UNTIL PAGE CONTAINS ELEMENT        ${addtobasket}   #Waits for "Add to Basket" to be available

    ${countofAddToBaskets}    get webelements     ${addtobasket}  #Gets the WebElements of "Add to Basket" available

    FOR      ${countofAddToBasket}   IN RANGE        ${numberofitems}   #Click "Add to Basket" for the number of passed valued
    Wait and Click     ${countofAddToBaskets[${countofAddToBasket}]}    #Clicks the elements for number of times
    END

    Move To Cart        #Moves to cart

    #Assert to verify "n" number of items have been actually added to cart
    WAIT UNTIL ELEMENT IS VISIBLE           ${numberofItemsInCart}
    ${numberofCartItems}=   get element count   ${numberofItemsInCart}              #Checks for the number of delete buttons present, which inturn gives the number of items present in the cart
    should be equal as numbers      ${numberofCartItems}        ${numberofitems}    #Number of items passed and Number of delete buttons must be same
    Log To Console And Capture Screenshot   "${numberofitems} Item(s) Added Successfully."

    #Clicks on Checkout button
    WAIT UNTIL ELEMENT IS ENABLED       ${checkout}
    Wait and Click                      ${checkout}
    WAIT UNTIL ELEMENT IS ENABLED         ${assert}
    Log To Console And Capture Screenshot  "Checkout Complete."


