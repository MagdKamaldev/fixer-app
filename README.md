# Fixer  

<img src="assets/images/logo12.png" width="200" height="200">

## Fixer is a system primarily utilized as a mobile application, catering to individuals seeking craftsmen to address various household repair needs

## App Architecture (MVVM)

### core

is the core folder of the project which contains the main classes and interfaces that are used in the project.

### features

this section is divided into the app features and each feature is divided into two main layers:

#### data

this layer is responsible for handling the data from the network or the database.

#### presentation

this layer is responsible for handling the UI and the user interactions.

## This is a documentation of the app features in action

### 1. Splash Screen

#### A) IOS and android till 11 version

| IOS and Adroid till 11| Android 12 + |
| --- | ------- |
| <img src="assets/docs/IMG-20240331-WA0091.jpg" height="500" width="250"> | <img src="assets/docs/Screenshot_20240331_142413.jpg" height="500" width="250"> |

### 2. Onboarding Screen

The onboarding screens introduce the users to the application and are designed to guide user seamlessly through app features.
Each onboarding screen has an arrow button to navigate through them and also is provided with a skip button to skip through all of them to the login button.

#### First onboarding screen

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/onboarding_1.jpg" height="500" width="250"> | <img src="assets/docs/onBoarding_ar_1.jpg" height="500" width="250"> |

#### Second onboarding screen

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/onboarding_2.jpg" height="500" width="250"> | <img src="assets/docs/onBoarding_ar_2.jpg" height="500" width="250"> |

#### Third onboarding screen

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/onBoarding_3.jpg" height="500" width="250"> | <img src="assets/docs/onBoarding_ar_3.jpg" height="500" width="250"> |

### 3. Login screen

The login screen is the first actual interaction with the user. Entering an email and password to register and have an account with the option to log in through the user's Google account.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/login.jpg" height="500" width="250"> | <img src="assets/docs/login_arab.jpg" height="500" width="250"> |

### 4.User Sign Up screen

This screen gives the user the option to sign up as a client or as a craftsmen. 

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/sign_up_eng.jpg" height="500" width="250"> | <img src="assets/docs/sign_up_arb.jpg" height="500" width="250" > |

### 5.client app Journey 

### 5.1.Client Phone number insert screen  

When the user chooses to sign up as a client this screen appears so that the user enters his phone number to get a confirmation code sent to his phone number.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/phone_num_eng.jpg" height="500" width="250"> | <img src="assets/docs/phone_num_arab.jpg" height="500" width="250"> |

### 5.2.Client Confirmation code screen

The code is sent to the client's number and is entered in this screen and the code can be resent incase of faliure.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/confirmation_code_eng.jpg" height="500" width="250"> | <img src="assets/docs/confirmation_code_arb.jpg" height="500" width="250"> |

### 5.3.client sign up form 

the client is navigated to this screen to enter his username,email and password 

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/user_sign_up_form_eng.jpg" height="500" width="250"> | <img src="assets/docs/user_sign_up_form_arab.jpg" height="500" width="250"> |

### 5.4.terms and condition screen

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Termsandconditions_eng.jpg" height="500" width="250"> | <img src="assets/docs/Termsandcondtions_arab.jpg" height="500" width="250"> |

### 5.5.Cleint location detail screen 

Then client enters his address details or the place he wishes to recieve the service.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/user_address_eng.jpg" height="500" width="250"> | <img src="assets/docs/user_address_arb.jpg" height="500" width="250"> |

### 5.6.Clinet location on map selection screen 
| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/user_location_selection_eng.jpg" height="500" width="250"> | <img src="assets/docs/user_location_selection_arab.jpg" height="500" width="250"> |

### 5.7.client homescreen

After completeing the sign up process,the cilent is then navigated to the home screen 

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/HomeView_en.jpg" height="500" width="250"> | <img src="assets/docs/HomeView_arab.jpg" height="500" width="250"> |

### 5.8.client request process 

when teh client clicks on request now button, a pop up appears to choose between electric or plumbing category

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/RequestNowPopUp_en.jpg" height="500" width="250"> | <img src="assets/docs/RequestNowPopUp_arab.jpg" height="500" width="250"> |

then the depending on his choice he is then navigated to all services available in each category 

in case of choosing electric:

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/ServicesView_en.jpg" height="500" width="250"> | <img src="assets/docs/ServicesView_arab.jpg" height="500" width="250"> |

in case of choosing plumbing: 


then after selecting a service a pop up appears to confirm requesting the right service 

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/ServicePopUp_en.jpg" height="500" width="250"> | <img src="assets/docs/ServicePopUp_arab.jpg" height="500" width="250"> |

then he is then navigated to the a screen that lists the location , requested services and total price of request

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/ConfirmRequestMap_en.jpg" height="500" width="250"> | <img src="assets/docs/ConfirmRequestMap_arab.jpg" height="500" width="250"> |

if he clicks on the service than a list of all services requested will appear as bottom sheet

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/RequestedServices_en.jpg" height="500" width="250"> | <img src="assets/docs/RequestedServices_arab.jpg" height="500" width="250"> |

after confirming the request the client is then navigated to a screen showing all the available craftsmen in his area with their ratings , prices and number of services they have done before.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Availablecraftmen_eng.jpg" height="500" width="250"> | <img src="assets/docs/Availablecraftmen_arab.jpg" height="500" width="250"> |

incase there are no available craftsman this meassage will appear

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Availablecraftmen_eng.jpg" height="500" width="250"> | <img src="assets/docs/Availablecraftmen_arab.jpg" height="500" width="250"> |

incase the service is not availabe in his area this message will appear

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/AreaNotAvailab_en.jpg" height="500" width="250"> | <img src="assets/docs/AreaNotAvailable_arab.jpg" height="500" width="250"> |

then he have to click on "cancel request" to return to home screen 

### 5.9.call craftman

when the user clicks confrim then he is navigated to a screen to all the craftman

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Callcraftmen_ar.jpg" height="500" width="250"> | <img src="assets/docs/Callcraftmen_ar.jpg" height="500" width="250"> |

### 5.10.Ongoing service screen 

this screen appears as long as the service is still ongoing 

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Ongoingservice_en.jpg" height="500" width="250"> | <img src="assets/docs/Ongoingservice_arab.jpg" height="500" width="250"> |

### 5.11.rating craftmen screen 

after the service is done the clients rates the craftfen on his service 

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Ratecraftmen_en.jpg" height="500" width="250"> | <img src="assets/docs/Ratecraftmen_arab.jpg" height="500" width="250"> |

### 5.12.payment screen 

after completeing the service tha user is then navigated to the payment screen 


| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/PaymentScreen_en.jpg" height="500" width="250"> | <img src="assets/docs/PaymentScreen_arab.jpg" height="500" width="250"> |


| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/PaymentProcess_eng.jpg" height="500" width="250"> | <img src="assets/docs/PaymentProcess_ara.jpg" height="500" width="250"> |

### 5.12 client request history screen 

the request icon in nav bar shows the history of ongonig or done services that the client had recieved.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Orderview_en.jpg" height="500" width="250"> | <img src="assets/docs/Orderviews_arab.jpg" height="500" width="250"> |

and when client clicks on order the order details screen appear

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Orderdetails_en.jpg" height="500" width="250"> | <img src="assets/docs/Orderdetails_arab.jpg" height="500" width="250"> |


### 5.13 stores screen 

the store icon in nav bar navigates to all available stores.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/AllStores_en.jpg" height="500" width="250"> | <img src="assets/docs/AllStores_arab.jpg" height="500" width="250"> |

if the client clicks on any store then a screen displaying all items in that store appears

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/StoresItems_en.jpg" height="500" width="250"> | <img src="assets/docs/StoreItems_arab .jpg" height="500" width="250"> |


### 5.14 client profile 

the profile icon in nav bar navigates to profile of client

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/Profile_en.jpg" height="500" width="250"> | <img src="assets/docs/Profile_arab.jpg" height="500" width="250"> |

### 6.Craftman app journey
### 6.1.Craftsman phone number insert screen

When the user chooses to sign up as a craftman, this screens appears to enter his phone number 

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/craftsman_phone_en.jpg" height="500" width="250"> | <img src="assets/docs/craftsman_phone_en.jpg" height="500" width="250"> |

### 6.2.Craftsman confirmation code screen

The code sent to the craftsman's number is entered to this screen and the code can be resent incase of faliure.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/confirmation_code_eng.jpg" height="500" width="250"> | <img src="assets/docs/confirmation_code_arb.jpg" height="500" width="250"> |

### 6.3.Craftman's password screen

When the craftman confirms the code sent to him, then he navigates to the password screen to set a password the meets the requirments for security.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/craftsman_password_en.jpg" height="500" width="250"> | <img src="assets/docs/craftsman_password_en.jpg" height="500" width="250"> |

### 6.4.Craftmen information entry form screen

After the craftman sets his password the he is navigated to a form to enter his personal information name, national Id, and the city he lives in.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/craftsman_form_en.jpg" height="500" width="250"> | <img src="assets/docs/craftsman_form_en.jpg" height="500" width="250"> |

### 6.5.Craftemn service selection screen

Then the craftmen is navigated to this screen to select which service does he wish to provide through the app. 

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/craftsman_field_select_en.jpg" height="500" width="250"> | <img src="assets/docs/craftsman_field_select_en.jpg" height="500" width="250"> |

### 6.6.Inserting personal IDs photos screen

Then the craftsman is then navigated to this screen to enter his personal ID photo.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/upload_id_en.jpg" height="500" width="250"> | <img src="assets/docs/upload_id_ar.jpg" height="500" width="250"> |

### 6.7.Inserting Operating Locations

Them the craftsman is then navigated to this screen to enter the locations he will operate in.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/set_locations_en.jpg" height="500" width="250"> | <img src="assets/docs/set_locations_ar.jpg" height="500" width="250"> |

### 6.8.Inserting personal profile image

Them the craftsman is then navigated to upload his profile image.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/upload_profile_en.jpg" height="500" width="250"> | <img src="assets/docs/upload_profile_ar.jpg" height="500" width="250"> |

### 6.9.waiting screen

Them the craftsman is then navigated to this untill an admin approves his application.

| English | Arabic |
| ------- | ------ |
| <img src="assets/docs/waiting_en.jpg" height="500" width="250"> | <img src="assets/docs/waiting_ar.jpg" height="500" width="250"> |