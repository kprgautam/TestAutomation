*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/Resources.robot

*** Variables ***
${itemname}         //div[@class='item-name']
${searchItem}       (//span[@id='searchValue'])[1]

*** Keywords ***
Verify Desired Item Is Present And Its Quanity

    WAIT UNTIL PAGE CONTAINS ELEMENT    ${searchItem}   #Waits for the searched item text
    ${textofSearchedItem}=    GET TEXT  ${searchItem}   #Gets Text of the searched item

    WAIT UNTIL PAGE CONTAINS ELEMENT    ${itemname}     #Waits until Item name of the searched product is present
    ${count}    Get Element Count       ${itemname}     #Gets count of the searched product
    Log To Console And Capture Screenshot     There are ${count} ${textofSearchedItem} products in this page.

    #Checks if searched item contains the items on page
    ELEMENT SHOULD CONTAIN           ${itemname}      ${textofSearchedItem}
    Log To Console And Capture Screenshot                Only ${textofSearchedItem} Products are available.


Verify Undesired Product Is Not Present
    [Arguments]     ${undesiredItem}

    element should not contain          ${itemname}         ${undesiredItem}
    Log To Console And Capture Screenshot                "No ${undesiredItem} Products Found".



