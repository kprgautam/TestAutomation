*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/Resources.robot

*** Variables ***
${i}

*** Keywords ***
Clear Exisitng Data
        #Pass the element to be present
        #Gets the count of an element and clicks it that many number of times
        #in this case, counts the number of DELETE button and clicks them those many times
        [Arguments]     ${locator}  ${clickelement}

        @{numbeofitems}=    Selenium2Library.Get WebElements  ${locator}
        ${count}=   GET ELEMENT COUNT  ${locator}

        log to console    "${count} item(s) found to delete."

        FOR     ${i}    IN  @{numbeofitems}                                     #Clicks the desired locater
        Wait and Click      ${clickelement}
        sleep  0.5s
        END