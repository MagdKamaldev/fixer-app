// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Connect users with skilled \n craftsmen instantly.`
  String get onBoardingText1 {
    return Intl.message(
      'Connect users with skilled \n craftsmen instantly.',
      name: 'onBoardingText1',
      desc: '',
      args: [],
    );
  }

  /// `Recieve competitive bids,\n compare prices,and make \n informed decisions.`
  String get onBoardingText2 {
    return Intl.message(
      'Recieve competitive bids,\n compare prices,and make \n informed decisions.',
      name: 'onBoardingText2',
      desc: '',
      args: [],
    );
  }

  /// `Make hassle-free transcations \n within the app for peace of \n mind.`
  String get onBoardingText3 {
    return Intl.message(
      'Make hassle-free transcations \n within the app for peace of \n mind.',
      name: 'onBoardingText3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back !`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back !',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordform {
    return Intl.message(
      'Enter your password',
      name: 'passwordform',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember {
    return Intl.message(
      'Remember me',
      name: 'remember',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot {
    return Intl.message(
      'Forgot Password',
      name: 'forgot',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signin {
    return Intl.message(
      'Sign in',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with google`
  String get withgoogle {
    return Intl.message(
      'Sign in with google',
      name: 'withgoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with google`
  String get signupwithgoogle {
    return Intl.message(
      'Sign in with google',
      name: 'signupwithgoogle',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noaccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noaccount',
      desc: '',
      args: [],
    );
  }

  /// ` Sign up`
  String get signup {
    return Intl.message(
      ' Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `YOUR FIX , OUR EXPERTISE.`
  String get slogan {
    return Intl.message(
      'YOUR FIX , OUR EXPERTISE.',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `Browse craftsmen for repair \n and maintainance service`
  String get getstartintro {
    return Intl.message(
      'Browse craftsmen for repair \n and maintainance service',
      name: 'getstartintro',
      desc: '',
      args: [],
    );
  }

  /// `Let’s get started `
  String get getstart {
    return Intl.message(
      'Let’s get started ',
      name: 'getstart',
      desc: '',
      args: [],
    );
  }

  /// `Sign up as user`
  String get signup_user {
    return Intl.message(
      'Sign up as user',
      name: 'signup_user',
      desc: '',
      args: [],
    );
  }

  /// `Sign up as craftsman`
  String get signup_craft {
    return Intl.message(
      'Sign up as craftsman',
      name: 'signup_craft',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirmation code`
  String get entercode {
    return Intl.message(
      'Enter confirmation code',
      name: 'entercode',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone {
    return Intl.message(
      'Phone number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enteryphonenumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enteryphonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your user name`
  String get enteryUserName {
    return Intl.message(
      'Enter your user name',
      name: 'enteryUserName',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code we sent to `
  String get enteryourcode {
    return Intl.message(
      'Enter the 6-digit code we sent to ',
      name: 'enteryourcode',
      desc: '',
      args: [],
    );
  }

  /// `After 40 seconds you can`
  String get after40sec {
    return Intl.message(
      'After 40 seconds you can',
      name: 'after40sec',
      desc: '',
      args: [],
    );
  }

  /// `Resend code by SMS`
  String get resendcodeSMS {
    return Intl.message(
      'Resend code by SMS',
      name: 'resendcodeSMS',
      desc: '',
      args: [],
    );
  }

  /// `if you didn’t receive the code by SMS , please request`
  String get nocoderecieved {
    return Intl.message(
      'if you didn’t receive the code by SMS , please request',
      name: 'nocoderecieved',
      desc: '',
      args: [],
    );
  }

  /// `Resend code by Call`
  String get resendcodeCALL {
    return Intl.message(
      'Resend code by Call',
      name: 'resendcodeCALL',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Building name`
  String get building {
    return Intl.message(
      'Building name',
      name: 'building',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Apt.no.`
  String get Aptartment {
    return Intl.message(
      'Apt.no.',
      name: 'Aptartment',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Aditional directions (options)`
  String get aditionalDirections {
    return Intl.message(
      'Aditional directions (options)',
      name: 'aditionalDirections',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getstarted {
    return Intl.message(
      'Get started',
      name: 'getstarted',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get nationalid {
    return Intl.message(
      'National ID',
      name: 'nationalid',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Name`
  String get nameField {
    return Intl.message(
      'Enter your Name',
      name: 'nameField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your user name`
  String get UserNameField {
    return Intl.message(
      'Enter your user name',
      name: 'UserNameField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your national ID`
  String get nationalidfield {
    return Intl.message(
      'Enter your national ID',
      name: 'nationalidfield',
      desc: '',
      args: [],
    );
  }

  /// `Enter your city`
  String get cityfield {
    return Intl.message(
      'Enter your city',
      name: 'cityfield',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the `
  String get agree {
    return Intl.message(
      'I agree to the ',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// ` terms & policy`
  String get termsandpolicy {
    return Intl.message(
      ' terms & policy',
      name: 'termsandpolicy',
      desc: '',
      args: [],
    );
  }

  /// `Choose your field`
  String get chooseyourfield {
    return Intl.message(
      'Choose your field',
      name: 'chooseyourfield',
      desc: '',
      args: [],
    );
  }

  /// `It must contain at least two of:numbers,letters,or symbols`
  String get passwordinstructions {
    return Intl.message(
      'It must contain at least two of:numbers,letters,or symbols',
      name: 'passwordinstructions',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get fullname {
    return Intl.message(
      'Name',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get fullnamefield {
    return Intl.message(
      'Enter your name',
      name: 'fullnamefield',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailfield {
    return Intl.message(
      'Enter your email',
      name: 'emailfield',
      desc: '',
      args: [],
    );
  }

  /// ` Already have an account?`
  String get alreadyhaveaccount {
    return Intl.message(
      ' Already have an account?',
      name: 'alreadyhaveaccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotpass {
    return Intl.message(
      'Forgot password',
      name: 'forgotpass',
      desc: '',
      args: [],
    );
  }

  /// `  We’ll send a verification code to this\nnumber if it matches an existing account`
  String get messageforgotpass {
    return Intl.message(
      '  We’ll send a verification code to this\nnumber if it matches an existing account',
      name: 'messageforgotpass',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextbutton {
    return Intl.message(
      'Next',
      name: 'nextbutton',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetpassword {
    return Intl.message(
      'Reset password',
      name: 'resetpassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newpassword {
    return Intl.message(
      'New password',
      name: 'newpassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get newpasswordfield {
    return Intl.message(
      'Enter your new password',
      name: 'newpasswordfield',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get Confirmnewpassword {
    return Intl.message(
      'Confirm new password',
      name: 'Confirmnewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your new password`
  String get Confirmnewpasswordfield {
    return Intl.message(
      'Confirm your new password',
      name: 'Confirmnewpasswordfield',
      desc: '',
      args: [],
    );
  }

  /// `Upload your national ID`
  String get uploadid {
    return Intl.message(
      'Upload your national ID',
      name: 'uploadid',
      desc: '',
      args: [],
    );
  }

  /// `Upload your Profile photo`
  String get uploadphoto {
    return Intl.message(
      'Upload your Profile photo',
      name: 'uploadphoto',
      desc: '',
      args: [],
    );
  }

  /// `This field already is Done !`
  String get doneField {
    return Intl.message(
      'This field already is Done !',
      name: 'doneField',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `You must accept the terms and policy !`
  String get accepttermsandpolicy {
    return Intl.message(
      'You must accept the terms and policy !',
      name: 'accepttermsandpolicy',
      desc: '',
      args: [],
    );
  }

  /// `Field must not be empty !`
  String get emptyValidation {
    return Intl.message(
      'Field must not be empty !',
      name: 'emptyValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the code !`
  String get completeCode {
    return Intl.message(
      'Please complete the code !',
      name: 'completeCode',
      desc: '',
      args: [],
    );
  }

  /// `Please add your phone number !`
  String get phoneValidation {
    return Intl.message(
      'Please add your phone number !',
      name: 'phoneValidation',
      desc: '',
      args: [],
    );
  }

  /// `Set your home location`
  String get setHomeLocation {
    return Intl.message(
      'Set your home location',
      name: 'setHomeLocation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm location`
  String get confirmLocation {
    return Intl.message(
      'Confirm location',
      name: 'confirmLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location services are disabled`
  String get locationServicesDisabled {
    return Intl.message(
      'Location services are disabled',
      name: 'locationServicesDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permission denied`
  String get locationPermissionDenied {
    return Intl.message(
      'Location permission denied',
      name: 'locationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Please Sign Up first !`
  String get signUpFirst {
    return Intl.message(
      'Please Sign Up first !',
      name: 'signUpFirst',
      desc: '',
      args: [],
    );
  }

  /// `Please Set Location first !`
  String get setLocationFirst {
    return Intl.message(
      'Please Set Location first !',
      name: 'setLocationFirst',
      desc: '',
      args: [],
    );
  }

  /// `select your area !`
  String get selectArea {
    return Intl.message(
      'select your area !',
      name: 'selectArea',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Front`
  String get uploadFront {
    return Intl.message(
      'Front',
      name: 'uploadFront',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get uploadBack {
    return Intl.message(
      'Back',
      name: 'uploadBack',
      desc: '',
      args: [],
    );
  }

  /// `upload option`
  String get uploadOptions {
    return Intl.message(
      'upload option',
      name: 'uploadOptions',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Uploading ...`
  String get uploading {
    return Intl.message(
      'Uploading ...',
      name: 'uploading',
      desc: '',
      args: [],
    );
  }

  /// `Set Locations`
  String get setLocations {
    return Intl.message(
      'Set Locations',
      name: 'setLocations',
      desc: '',
      args: [],
    );
  }

  /// `Please Set areas You can work in !`
  String get setLocationsInstructions {
    return Intl.message(
      'Please Set areas You can work in !',
      name: 'setLocationsInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Please wait, Your application is Being Reviewd !`
  String get reviewingApp {
    return Intl.message(
      'Please wait, Your application is Being Reviewd !',
      name: 'reviewingApp',
      desc: '',
      args: [],
    );
  }

  /// `Complains`
  String get complains {
    return Intl.message(
      'Complains',
      name: 'complains',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Add Complain`
  String get addComplain {
    return Intl.message(
      'Add Complain',
      name: 'addComplain',
      desc: '',
      args: [],
    );
  }

  /// `Complain Message`
  String get complainMessage {
    return Intl.message(
      'Complain Message',
      name: 'complainMessage',
      desc: '',
      args: [],
    );
  }

  /// `Contact Mail`
  String get contactMail {
    return Intl.message(
      'Contact Mail',
      name: 'contactMail',
      desc: '',
      args: [],
    );
  }

  /// `No Complain Messges Yet !`
  String get noComplains {
    return Intl.message(
      'No Complain Messges Yet !',
      name: 'noComplains',
      desc: '',
      args: [],
    );
  }

  /// `welcome`
  String get welcome {
    return Intl.message(
      'welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Request service`
  String get Requestservice {
    return Intl.message(
      'Request service',
      name: 'Requestservice',
      desc: '',
      args: [],
    );
  }

  /// `Request Now`
  String get requestnow {
    return Intl.message(
      'Request Now',
      name: 'requestnow',
      desc: '',
      args: [],
    );
  }

  /// `Your Fix,Our Expertise`
  String get yourfixOurExpertise {
    return Intl.message(
      'Your Fix,Our Expertise',
      name: 'yourfixOurExpertise',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Electric`
  String get electric {
    return Intl.message(
      'Electric',
      name: 'electric',
      desc: '',
      args: [],
    );
  }

  /// `Plumbing`
  String get plumbing {
    return Intl.message(
      'Plumbing',
      name: 'plumbing',
      desc: '',
      args: [],
    );
  }

  /// `Expert electrical repairs, fast and reliable.`
  String get electricDes {
    return Intl.message(
      'Expert electrical repairs, fast and reliable.',
      name: 'electricDes',
      desc: '',
      args: [],
    );
  }

  /// `Swift plumbing fixes.`
  String get plumbingDes {
    return Intl.message(
      'Swift plumbing fixes.',
      name: 'plumbingDes',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get Stores {
    return Intl.message(
      'Stores',
      name: 'Stores',
      desc: '',
      args: [],
    );
  }

  /// `All stores`
  String get allStores {
    return Intl.message(
      'All stores',
      name: 'allStores',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get Requests {
    return Intl.message(
      'Requests',
      name: 'Requests',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get Profile {
    return Intl.message(
      'profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Field`
  String get field {
    return Intl.message(
      'Field',
      name: 'field',
      desc: '',
      args: [],
    );
  }

  /// `Upload Profile Image`
  String get uploadProfile {
    return Intl.message(
      'Upload Profile Image',
      name: 'uploadProfile',
      desc: '',
      args: [],
    );
  }

  /// `All Items`
  String get allItems {
    return Intl.message(
      'All Items',
      name: 'allItems',
      desc: '',
      args: [],
    );
  }

  /// `Left in the store`
  String get left {
    return Intl.message(
      'Left in the store',
      name: 'left',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get morning {
    return Intl.message(
      'Good Morning',
      name: 'morning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get afternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get evening {
    return Intl.message(
      'Good Evening',
      name: 'evening',
      desc: '',
      args: [],
    );
  }

  /// `No items Yet !`
  String get noItems {
    return Intl.message(
      'No items Yet !',
      name: 'noItems',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to Request a service`
  String get doyouwanttorequestservice {
    return Intl.message(
      'Do you want to Request a service',
      name: 'doyouwanttorequestservice',
      desc: '',
      args: [],
    );
  }

  /// `Which service would you like to request?`
  String get whichservicedoyouliketorequest {
    return Intl.message(
      'Which service would you like to request?',
      name: 'whichservicedoyouliketorequest',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Your Location`
  String get location {
    return Intl.message(
      'Your Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Requested Services`
  String get requestedservices {
    return Intl.message(
      'Requested Services',
      name: 'requestedservices',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Request`
  String get confirmrequest {
    return Intl.message(
      'Confirm Request',
      name: 'confirmrequest',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Request`
  String get cancelrequest {
    return Intl.message(
      'Cancel Request',
      name: 'cancelrequest',
      desc: '',
      args: [],
    );
  }

  /// `Available Craftsmen`
  String get availablecraftmen {
    return Intl.message(
      'Available Craftsmen',
      name: 'availablecraftmen',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDeatils {
    return Intl.message(
      'Order Details',
      name: 'orderDeatils',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `No Requests Yet !`
  String get noRequests {
    return Intl.message(
      'No Requests Yet !',
      name: 'noRequests',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get totalBalance {
    return Intl.message(
      'Total Balance',
      name: 'totalBalance',
      desc: '',
      args: [],
    );
  }

  /// `(Prices may vary depending on craftsmen rates)`
  String get pricesmayvary {
    return Intl.message(
      '(Prices may vary depending on craftsmen rates)',
      name: 'pricesmayvary',
      desc: '',
      args: [],
    );
  }

  /// `Request Details`
  String get requestdetails {
    return Intl.message(
      'Request Details',
      name: 'requestdetails',
      desc: '',
      args: [],
    );
  }

  /// `Price details`
  String get pricedetails {
    return Intl.message(
      'Price details',
      name: 'pricedetails',
      desc: '',
      args: [],
    );
  }

  /// `Your Total`
  String get yourtotal {
    return Intl.message(
      'Your Total',
      name: 'yourtotal',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Leave a comment`
  String get leavecomment {
    return Intl.message(
      'Leave a comment',
      name: 'leavecomment',
      desc: '',
      args: [],
    );
  }

  /// `How was your service with `
  String get howwasyourexperience {
    return Intl.message(
      'How was your service with ',
      name: 'howwasyourexperience',
      desc: '',
      args: [],
    );
  }

  /// `performance`
  String get performance {
    return Intl.message(
      'performance',
      name: 'performance',
      desc: '',
      args: [],
    );
  }

  /// ` No Reviews Yet !`
  String get NoReviews {
    return Intl.message(
      ' No Reviews Yet !',
      name: 'NoReviews',
      desc: '',
      args: [],
    );
  }

  /// `End Request`
  String get endRequest {
    return Intl.message(
      'End Request',
      name: 'endRequest',
      desc: '',
      args: [],
    );
  }

  /// `Request is ongoing !`
  String get ongoing {
    return Intl.message(
      'Request is ongoing !',
      name: 'ongoing',
      desc: '',
      args: [],
    );
  }

  /// `Poor Performance`
  String get poor {
    return Intl.message(
      'Poor Performance',
      name: 'poor',
      desc: '',
      args: [],
    );
  }

  /// `Fair Quality`
  String get fair {
    return Intl.message(
      'Fair Quality',
      name: 'fair',
      desc: '',
      args: [],
    );
  }

  /// `Good Craftsmanship`
  String get good {
    return Intl.message(
      'Good Craftsmanship',
      name: 'good',
      desc: '',
      args: [],
    );
  }

  /// `Excellent Workmanship`
  String get amazing {
    return Intl.message(
      'Excellent Workmanship',
      name: 'amazing',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get clientName {
    return Intl.message(
      'Client Name',
      name: 'clientName',
      desc: '',
      args: [],
    );
  }

  /// `Craftsman Name`
  String get craftsmanName {
    return Intl.message(
      'Craftsman Name',
      name: 'craftsmanName',
      desc: '',
      args: [],
    );
  }

  /// `Request Status`
  String get requestStatus {
    return Intl.message(
      'Request Status',
      name: 'requestStatus',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get orderId {
    return Intl.message(
      'Order ID',
      name: 'orderId',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
