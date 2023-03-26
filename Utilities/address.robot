*** Settings ***
Library     Selenium2Library
Resource  ../../Utilities/Resources.robot

*** Variables ***
${country}          Thailand                    #Text to enter into the address field.
${name}             Gowtham Kolampaka
${mobilenumber}     9898989898
${zipcode}          10000
${address}          Asoke
${city}             Phra Khanong
${state}            Bangkok
${addNewAddress}        //span[normalize-space()='Add New Address']         #Address page elements
${countrypath}          //input[@placeholder='Please provide a country.']
${namepath}             //input[@placeholder="Please provide a name."]
${numberpath}           //input[@placeholder='Please provide a mobile number.']
${ZIPpath}              //input[@placeholder='Please provide a ZIP code.']
${Addresspath}          //textarea[@placeholder='Please provide an address.']
${Citypath}             //input[@placeholder='Please provide a city.']
${Statepath}            //input[@placeholder='Please provide a state.']
${SubmitButttonpath}    //button[@id='submitButton']//span[@class='mat-button-wrapper']
${assertElement}        //span[normalize-space()='Pay using wallet']

*** Keywords ***
Add New Address
    sleep                           1s
    Wait and Click                  ${addNewAddress}
    WAIT UNTIL ELEMENT IS ENABLED   ${countrypath}
    Clear and Input             ${countrypath}      ${country}
    Clear and Input             ${namepath}         ${name}
    Clear and Input             ${numberpath}       ${mobilenumber}
    Clear and Input             ${ZIPpath}          ${zipcode}
    Clear and Input             ${Addresspath}      ${address}
    Clear and Input             ${Citypath}         ${city}
    Clear and Input             ${Statepath}        ${state}
    Wait and Click              ${SubmitButttonpath}
    page should not contain element  ${addNewAddress}                       #Assert
    Log To Console And Capture Screenshot  "Address Added Succesfully."


Select Address                                                              #To select the entered address
    Wait and Click      //mat-row[1]//mat-cell[1]
    Wait and Click      //span[normalize-space()='Continue']
    page should not contain element  ${assertElement}           #Assert
    Log To Console And Capture Screenshot  "Address Selected Successfully."



