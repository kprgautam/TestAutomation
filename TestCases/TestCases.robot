*** Settings ***
Library     Selenium2Library
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/Resources.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/loginWebsite.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/clearCart.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/addItemToBasket.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/address.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/delivery.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/clearAddressBook.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/skipif.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/searchForApple.robot
Resource  /Users/kprgautam/PycharmProjects/TestAutomation/Utilities/verifyAppleIsPresent.robot


Test Setup  Resources.startTest                     #Launches browser, opens the website, dismisses couple of elemets
Test Teardown  Resources.closeTest                  #Closes all browsers


*** Test Cases ***
Test Case 1: Add 1 item to the basket.
    [Tags]  QA Challenge
       Login To The Website                                         #Logs into the website
       Move To Cart                                                 #Moves into the logged in user's basket
            Skip If Empty           Clear Cart                      #Checks the cart for any existing items and deletes them, if no items are available then redirects to Homepage
       Move To Address Book                                         ##Moves into the logged in user's address book
            Skip If Empty           Clear Address Book              #Checks the addres book for any existing items and deletes them, if no items are available then redirects to Homepage
       Add Item(s) To Cart          1                               #Adds the number of items specified
       Add New Address                                              #Adds a new address
       Select Address                                               #Selects the added address
       Select Delivery                                              #Selects the delivery

Test Case 2: Add 2 items to the basket.
    [Tags]  QA Challenge
       Login To The Website                                         #Logs into the website
       Move To Cart                                                 #Moves into the logged in user's basket
            Skip If Empty           Clear Cart                      #Checks the cart for any existing items and deletes them, if no items are available then redirects to Homepage
       Move To Address Book                                         ##Moves into the logged in user's address book
            Skip If Empty           Clear Address Book              #Checks the addres book for any existing items and deletes them, if no items are available then redirects to Homepage
       Add Item(s) To Cart          2                               #Adds the number of items specified
       Add New Address                                              #Adds a new address
       Select Address                                               #Selects the added address
       Select Delivery                                              #Selects the delivery

Test Case 3: Search for Apple, verify that 2 Apple products show up and Banana product does not show up.
    [Tags]  QA Challenge
        Search For                                               Apple          #Seaches for Apple
        Verify Desired Item Is Present And Its Quanity                          #Verifies Apple is present and its quantity
        Verify Undesired Product Is Not Present                  Banana         #Verifies Banana is not present

