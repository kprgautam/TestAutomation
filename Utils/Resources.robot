*** Settings ***
Library     Selenium2Library

*** Variables ***
${url}                  https://salaryhero-qa-challenge.herokuapp.com/#/
${browser}              chrome
${dismiss}              //span[normalize-space()='Dismiss']
${cookieDismiss}        //a[@aria-label='dismiss cookie message']
${moveToBasket}         //span[normalize-space()='Your Basket']
${headerbutton}         //span[@class='mat-button-wrapper']//span[contains(text(),'OWASP Juice Shop')]


*** Keywords ***
startTest           #Setup
    open browser   ${url}   ${browser}
    maximize browser window
    Wait and Click      ${dismiss}
    Wait and Click      ${cookieDismiss}

closeTest           #Teardown
    close all browsers

Wait and Click
    [Arguments]  ${locator}
    wait until page contains element    ${locator}
    scroll element into view            ${locator}
    click element                       ${locator}

Clear and Input
    [Arguments]  ${locator}     ${texttoenter}
    scroll element into view    ${locator}
    clear element text          ${locator}
    input text                  ${locator}  ${texttoenter}

Log To Console And Capture Screenshot           #Logs message to console and takes screenshot
    [Arguments]  ${textToAssert}
    LOG TO CONSOLE              ${textToAssert}
    ${time}=        Get Time    format=%H:%M:%S:%MS
    capture page screenshot     /Users/kprgautam/PycharmProjects/TestAutomation/venv/Attachments/Screenshot_${time}.png


Move To Cart
    WAIT AND CLICK      ${movetobasket}

Return Home
     WAIT AND CLICK     ${headerbutton}









