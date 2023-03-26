*** Settings ***
Library     Selenium2Library
Resource  ../../Utils/Resources.robot
Resource  ../../Utils/loginWebsite.robot
Resource  ../../Utils/removeItemsFromBasket.robot
Resource  ../../Utils/addItemToBasket.robot
Resource  ../../Utils/address.robot
Resource  ../../Utils/delivery.robot
Resource  ../../Utils/checkout.robot
Resource  ../../Utils/clearAddressBook.robot
Resource  ../../Utils/skipIf.robot
Resource  ../../Utils/searchForApple.robot
Resource  ../../Utils/verifyAppleIsPresent.robot


Test Setup  Resources.startTest                     #Launches browser, opens the website, dismisses couple of elemets
Test Teardown  Resources.closeTest                  #Closes all browsers


*** Test Cases ***
Test Case 1: Add 1 item to the basket.
    [Tags]  Salary Hero QA Challenge
       Login To The Website                                         #Logs into the website
       Move To Cart                                                 #Moves into the logged in user's basket
            Skip If Empty           Clear Cart                      #Checks the cart for any existing items and deletes them, if not items are available then redirects to Homepage
       Move To Address Book                                         ##Moves into the logged in user's address book
            Skip If Empty           Clear Address Book              #Checks the addres book for any existing items and deletes them, if not items are available then redirects to Homepage
       Add Item(s) To Basket        1                               #Adds the number of items specified
       Click Checkout                                               #Moves from checkout page
       Add New Address                                              #Adds a new address
       Select Address                                               #Selects the added address
       Select Delivery                                              #Selects the delivery

Test Case 2: Add 2 items to the basket.
    [Tags]  Salary Hero QA Challenge
       Login To The Website                                         #Logs into the website
       Move To Cart                                                 #Moves into the logged in user's basket
            Skip If Empty           Clear Cart                      #Checks the cart for any existing items and deletes them, if not items are available then redirects to Homepage
       Move To Address Book                                         ##Moves into the logged in user's address book
            Skip If Empty           Clear Address Book              #Checks the addres book for any existing items and deletes them, if not items are available then redirects to Homepage
       Add Item(s) To Basket        2                               #Adds the number of items specified
       Click Checkout                                               #Moves from checkout page
       Add New Address                                              #Adds a new address
       Select Address                                               #Selects the added address
       Select Delivery                                              #Selects the delivery

Test Case 3: Search for Apple, verify that 2 Apple products show up and Banana product does not show up.
    [Tags]  Salary Hero QA Challenge
        Search For                                               Apple          #Seaches for Apple
        Verify Desired Item Is Present And Its Quanity                          #Verifies Apple is present and its quantity
        Verify Undesired Product Is Not Present                  Banana         #Verifies Banana is not present

