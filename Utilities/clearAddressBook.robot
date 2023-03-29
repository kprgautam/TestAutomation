*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/Resources.robot
Resource  ../../Utilities/clearCart.robot
Resource  ../../Utilities/clearData.robot

*** Variables ***
${accountButton}            (//span[normalize-space()='Account'])[1]
${OPButton}                 //button[@aria-label='Show Orders and Payment Menu']//span[contains(text(),'Orders & Payment')]
${savedAddressButton}       (//span[normalize-space()='My saved addresses'])
${locatorAddress}           (//*[name()='svg'][@data-icon='trash-alt'])
${clickelementAddress}      (//*[name()='svg'][@role='img'])[3]

*** Keywords ***
Move To Address Book        #To Move to addressbook
         Wait and Click                             ${accountButton}
         Wait and Click                             ${OPButton}
         Wait and Click                             ${savedAddressButton}

Clear Address Book      #Uses another keyword to check if any addresses are present to be deleted
         Clear Exisitng Data                        ${locatorAddress}      ${clickelementAddress}
         wait until page does not contain element   ${locatorAddress}
         Log To Console And Capture Screenshot      "All Addresses Deleted."
