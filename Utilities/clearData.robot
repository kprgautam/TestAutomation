*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/Resources.robot

*** Keywords ***
Clear Exisitng Data
        [Arguments]     ${locator}  ${clickelement}   ${i}  #Pass the element to be present, clicked an number of times
        @{numbeofitems}=    Selenium2Library.Get WebElements  ${locator}
        ${count}=   GET ELEMENT COUNT  ${locator}
        log to console    "${count} item(s) found to delete."
        FOR     ${i}    IN  @{numbeofitems}   #Clicks the desired located
        Wait and Click      ${clickelement}
        sleep  0.5s
        END