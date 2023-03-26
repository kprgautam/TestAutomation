*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/Resources.robot

*** Variables ***
${itemname}         //div[@class='item-name']
${searchItem}       (//span[@id='searchValue'])[1]

*** Keywords ***
Verify Desired Item Is Present And Its Quanity
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${searchItem}

    ${textofSearchedItem}=    GET TEXT  ${searchItem}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${itemname}     ${None}

    ${count}    Get Element Count    ${itemname}
    Log To Console And Capture Screenshot           There are ${count} ${textofSearchedItem} products in this page.

    element should contain            ${itemname}             ${textofSearchedItem}
    Log To Console And Capture Screenshot                Only $${textofSearchedItem} Products are available.


Verify Undesired Product Is Not Present
    [Arguments]     ${undesiredItem}
    element should not contain          ${itemname}         ${undesiredItem}
    Log To Console And Capture Screenshot                "No ${undesiredItem} Products Found".



