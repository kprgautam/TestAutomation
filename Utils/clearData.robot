*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/Resources.robot

*** Keywords ***
Clear Exisitng Data
        [Arguments]     ${locator}  ${clickelement}   ${i}
        @{numbeofitems}=    Selenium2Library.Get WebElements  ${locator}
        Log    @{numbeofitems} buttons found on the page
        FOR     ${i}    IN  @{numbeofitems}
        Wait and Click      ${clickelement}
        sleep  0.5s
        END