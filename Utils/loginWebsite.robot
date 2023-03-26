*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/Resources.robot

*** Variables ***
${email}                qachallengesalaryhero@sh.com
${password}             QASalaryHero
${account}              //span[normalize-space()='Account']
${getToLogin}           //button[@id='navbarLoginButton']//span[contains(text(),'Login')]
${emailBox}             //input[@id='email']
${passwordBox}          //input[@id='password']
${login}                //button[@id='loginButton']//span[@class='mat-button-wrapper']
${basketAssert}         //span[normalize-space()='Your Basket']

*** Keywords ***
Login To The Website
    Wait and Click          ${account}
    Wait and Click          ${getToLogin}
    Clear and Input         ${emailBox}         ${email}
    Clear and Input         ${passwordBox}      ${password}
    Wait and Click          ${login}
    WAIT UNTIL PAGE CONTAINS ELEMENT            ${basketAssert}
    Log To Console And Capture Screenshot       "Login Successful"

