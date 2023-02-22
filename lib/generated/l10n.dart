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

  /// `Hi, Welcome Back! 👋`
  String get login_greetings {
    return Intl.message(
      'Hi, Welcome Back! 👋',
      name: 'login_greetings',
      desc: '',
      args: [],
    );
  }

  /// `Login to your Account`
  String get login_message {
    return Intl.message(
      'Login to your Account',
      name: 'login_message',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get login_username_caption {
    return Intl.message(
      'Username',
      name: 'login_username_caption',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Username`
  String get login_username_hint {
    return Intl.message(
      'Please Enter Your Username',
      name: 'login_username_hint',
      desc: '',
      args: [],
    );
  }

  /// `Username can't be empty`
  String get login_username_empty {
    return Intl.message(
      'Username can\'t be empty',
      name: 'login_username_empty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Username`
  String get login_username_invalid {
    return Intl.message(
      'Invalid Username',
      name: 'login_username_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_password_caption {
    return Intl.message(
      'Password',
      name: 'login_password_caption',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Password`
  String get login_password_hint {
    return Intl.message(
      'Please Enter Your Password',
      name: 'login_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get login_password_empty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'login_password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password`
  String get login_password_invalid {
    return Intl.message(
      'Invalid Password',
      name: 'login_password_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get login_btx_forgot_password_ {
    return Intl.message(
      'Forgot Password?',
      name: 'login_btx_forgot_password_',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_btn_signin {
    return Intl.message(
      'Login',
      name: 'login_btn_signin',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get login_check_remember {
    return Intl.message(
      'Remember Me',
      name: 'login_check_remember',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get login_footer_no_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'login_footer_no_account',
      desc: '',
      args: [],
    );
  }

  /// `Login with Face ID`
  String get login_btx_login_faceid {
    return Intl.message(
      'Login with Face ID',
      name: 'login_btx_login_faceid',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Up `
  String get login_btx_signup {
    return Intl.message(
      ' Sign Up ',
      name: 'login_btx_signup',
      desc: '',
      args: [],
    );
  }

  /// `Login with OTP`
  String get login_btx_login_otp {
    return Intl.message(
      'Login with OTP',
      name: 'login_btx_login_otp',
      desc: '',
      args: [],
    );
  }

  /// `Login with OTP`
  String get otp_login_header_title {
    return Intl.message(
      'Login with OTP',
      name: 'otp_login_header_title',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get otp_login_mobile_caption {
    return Intl.message(
      'Mobile Number',
      name: 'otp_login_mobile_caption',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get otp_login_otp_caption {
    return Intl.message(
      'Enter OTP',
      name: 'otp_login_otp_caption',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get otp_login_btn_send {
    return Intl.message(
      'Send OTP',
      name: 'otp_login_btn_send',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get otp_login_btn_verify {
    return Intl.message(
      'Verify OTP',
      name: 'otp_login_btn_verify',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get otp_login_btn_resend {
    return Intl.message(
      'Resend OTP',
      name: 'otp_login_btn_resend',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP in {time} seconds`
  String otp_login_txt_in_seconds(Object time) {
    return Intl.message(
      'Resend OTP in $time seconds',
      name: 'otp_login_txt_in_seconds',
      desc: '',
      args: [time],
    );
  }

  /// `Login with Password`
  String get login_btx_login_password {
    return Intl.message(
      'Login with Password',
      name: 'login_btx_login_password',
      desc: '',
      args: [],
    );
  }

  /// `OTP sent successfully`
  String get msg_otp_sent {
    return Intl.message(
      'OTP sent successfully',
      name: 'msg_otp_sent',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get msg_unknown_error {
    return Intl.message(
      'Unknown Error',
      name: 'msg_unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get signup_greetings {
    return Intl.message(
      'Create an account',
      name: 'signup_greetings',
      desc: '',
      args: [],
    );
  }

  /// `Sign up for a new account`
  String get signup_message {
    return Intl.message(
      'Sign up for a new account',
      name: 'signup_message',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signup_email_caption {
    return Intl.message(
      'Email',
      name: 'signup_email_caption',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email Address`
  String get signup_email_hint {
    return Intl.message(
      'Please Enter Your Email Address',
      name: 'signup_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email address can't be empty`
  String get signup_email_empty {
    return Intl.message(
      'Email address can\'t be empty',
      name: 'signup_email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email address`
  String get signup_email_invalid {
    return Intl.message(
      'Invalid Email address',
      name: 'signup_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signup_password_caption {
    return Intl.message(
      'Password',
      name: 'signup_password_caption',
      desc: '',
      args: [],
    );
  }

  /// `Please enter new password`
  String get signup_password_hint {
    return Intl.message(
      'Please enter new password',
      name: 'signup_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get signup_password_empty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'signup_password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password`
  String get signup_password_invalid {
    return Intl.message(
      'Invalid Password',
      name: 'signup_password_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get signup_cnf_password_caption {
    return Intl.message(
      'Confirm Password',
      name: 'signup_cnf_password_caption',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Confirm password`
  String get signup_cnf_password_hint {
    return Intl.message(
      'Please enter Confirm password',
      name: 'signup_cnf_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password can't be empty`
  String get signup_cnf_password_empty {
    return Intl.message(
      'Confirm Password can\'t be empty',
      name: 'signup_cnf_password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password should match with password`
  String get signup_cnf_password_invalid {
    return Intl.message(
      'Confirm password should match with password',
      name: 'signup_cnf_password_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Reset your password`
  String get change_pass_title {
    return Intl.message(
      'Reset your password',
      name: 'change_pass_title',
      desc: '',
      args: [],
    );
  }

  /// `Your OTP verified successfully,\nNow Please enter new password to set password for `
  String get change_pass_caption {
    return Intl.message(
      'Your OTP verified successfully,\nNow Please enter new password to set password for ',
      name: 'change_pass_caption',
      desc: '',
      args: [],
    );
  }

  /// `Salem Mubarak Street, Gulf Road, Kuwait`
  String get location {
    return Intl.message(
      'Salem Mubarak Street, Gulf Road, Kuwait',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get signup_name_caption {
    return Intl.message(
      'Full Name',
      name: 'signup_name_caption',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get signup_mobile_caption {
    return Intl.message(
      'Mobile Number',
      name: 'signup_mobile_caption',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Mobile number`
  String get signup_mobile_hint {
    return Intl.message(
      'Please enter your Mobile number',
      name: 'signup_mobile_hint',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number can't be empty`
  String get signup_mobile_empty {
    return Intl.message(
      'Mobile Number can\'t be empty',
      name: 'signup_mobile_empty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Mobile number`
  String get signup_mobile_invalid {
    return Intl.message(
      'Invalid Mobile number',
      name: 'signup_mobile_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get signup_gender_caption {
    return Intl.message(
      'Gender',
      name: 'signup_gender_caption',
      desc: '',
      args: [],
    );
  }

  /// `Select a gender`
  String get signup_gender_hint {
    return Intl.message(
      'Select a gender',
      name: 'signup_gender_hint',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get signup_gender_option_male {
    return Intl.message(
      'Male',
      name: 'signup_gender_option_male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get signup_gender_option_female {
    return Intl.message(
      'Female',
      name: 'signup_gender_option_female',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get signup_gender_option_other {
    return Intl.message(
      'Other',
      name: 'signup_gender_option_other',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get signup_dob_caption {
    return Intl.message(
      'Date of Birth',
      name: 'signup_dob_caption',
      desc: '',
      args: [],
    );
  }

  /// `MM/DD/YYYY`
  String get signup_dob_hint {
    return Intl.message(
      'MM/DD/YYYY',
      name: 'signup_dob_hint',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get signup_nationality_caption {
    return Intl.message(
      'Nationality',
      name: 'signup_nationality_caption',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your Nationality`
  String get signup_nationality_hint {
    return Intl.message(
      'Please choose your Nationality',
      name: 'signup_nationality_hint',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signup_btn_create_account {
    return Intl.message(
      'Create Account',
      name: 'signup_btn_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signup_footer_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'signup_footer_have_account',
      desc: '',
      args: [],
    );
  }

  /// ` Sign In `
  String get signup_btx_signin {
    return Intl.message(
      ' Sign In ',
      name: 'signup_btx_signin',
      desc: '',
      args: [],
    );
  }

  /// `OTP verification`
  String get verifyotp_greeting {
    return Intl.message(
      'OTP verification',
      name: 'verifyotp_greeting',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyotp_message {
    return Intl.message(
      'Verify',
      name: 'verifyotp_message',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP`
  String get verifyotp_otp_caption {
    return Intl.message(
      'Enter the OTP',
      name: 'verifyotp_otp_caption',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get verifyotp_btx_resend_otp {
    return Intl.message(
      'Resend OTP',
      name: 'verifyotp_btx_resend_otp',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP in 59 Seconds`
  String get verifyotp_txt_wait {
    return Intl.message(
      'Resend OTP in 59 Seconds',
      name: 'verifyotp_txt_wait',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP entered`
  String get verifyotp_error_invalid {
    return Intl.message(
      'Invalid OTP entered',
      name: 'verifyotp_error_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Back to sign up`
  String get verifyotp_back {
    return Intl.message(
      'Back to sign up',
      name: 'verifyotp_back',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get verifyotp_btn_submit {
    return Intl.message(
      'Submit',
      name: 'verifyotp_btn_submit',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get clang_greeting {
    return Intl.message(
      'Choose Language',
      name: 'clang_greeting',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get clang_message {
    return Intl.message(
      'Select',
      name: 'clang_message',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get clang_caption {
    return Intl.message(
      'Language',
      name: 'clang_caption',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a language`
  String get clang_hint {
    return Intl.message(
      'Please choose a language',
      name: 'clang_hint',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get clang_btn_submit {
    return Intl.message(
      'Submit',
      name: 'clang_btn_submit',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get edit_profile_title {
    return Intl.message(
      'Profile',
      name: 'edit_profile_title',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get fp_header_title {
    return Intl.message(
      'Forgot Password',
      name: 'fp_header_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the mobile number associated with your account and we'll send an otp to reset your password.`
  String get fp_desc_mobile_message {
    return Intl.message(
      'Enter the mobile number associated with your account and we\'ll send an otp to reset your password.',
      name: 'fp_desc_mobile_message',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email associated with your account and we'll send an email with instructions to reset your password.`
  String get fp_desc_message {
    return Intl.message(
      'Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
      name: 'fp_desc_message',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get fp_email_caption {
    return Intl.message(
      'Email Address',
      name: 'fp_email_caption',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email Address`
  String get fp_email_hint {
    return Intl.message(
      'Enter Your Email Address',
      name: 'fp_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email address can't be empty`
  String get fp_email_empty {
    return Intl.message(
      'Email address can\'t be empty',
      name: 'fp_email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email Address`
  String get fp_email_invalid {
    return Intl.message(
      'Invalid Email Address',
      name: 'fp_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get fp_btn_submit {
    return Intl.message(
      'Submit',
      name: 'fp_btn_submit',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get fp_btx_login_back {
    return Intl.message(
      'Back to Login',
      name: 'fp_btx_login_back',
      desc: '',
      args: [],
    );
  }

  /// `Explore First`
  String get fp_btx_explore {
    return Intl.message(
      'Explore First',
      name: 'fp_btx_explore',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get contact_us_submit {
    return Intl.message(
      'Submit',
      name: 'contact_us_submit',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get change_language_submit {
    return Intl.message(
      'Submit',
      name: 'change_language_submit',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get nav_home {
    return Intl.message(
      'Home',
      name: 'nav_home',
      desc: '',
      args: [],
    );
  }

  /// `Mall Map`
  String get nav_map {
    return Intl.message(
      'Mall Map',
      name: 'nav_map',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get menu_about_us {
    return Intl.message(
      'About us',
      name: 'menu_about_us',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get menu_stores {
    return Intl.message(
      'Stores',
      name: 'menu_stores',
      desc: '',
      args: [],
    );
  }

  /// `Dining`
  String get menu_dining {
    return Intl.message(
      'Dining',
      name: 'menu_dining',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get menu_events {
    return Intl.message(
      'Events',
      name: 'menu_events',
      desc: '',
      args: [],
    );
  }

  /// `Offers and Promotions`
  String get menu_offers {
    return Intl.message(
      'Offers and Promotions',
      name: 'menu_offers',
      desc: '',
      args: [],
    );
  }

  /// `Leasing`
  String get menu_leasing {
    return Intl.message(
      'Leasing',
      name: 'menu_leasing',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get menu_gallery {
    return Intl.message(
      'Gallery',
      name: 'menu_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Opening hours`
  String get menu_opening_hr {
    return Intl.message(
      'Opening hours',
      name: 'menu_opening_hr',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get menu_contact {
    return Intl.message(
      'Contact',
      name: 'menu_contact',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get menu_choose_lang {
    return Intl.message(
      'Change Language',
      name: 'menu_choose_lang',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get menu_logout {
    return Intl.message(
      'Logout',
      name: 'menu_logout',
      desc: '',
      args: [],
    );
  }

  /// `Browse by category`
  String get home_sec_category {
    return Intl.message(
      'Browse by category',
      name: 'home_sec_category',
      desc: '',
      args: [],
    );
  }

  /// `Truly Great Brands`
  String get home_sec_brand {
    return Intl.message(
      'Truly Great Brands',
      name: 'home_sec_brand',
      desc: '',
      args: [],
    );
  }

  /// `Dining`
  String get home_sec_dining {
    return Intl.message(
      'Dining',
      name: 'home_sec_dining',
      desc: '',
      args: [],
    );
  }

  /// `Promotions and offers`
  String get home_sec_promo {
    return Intl.message(
      'Promotions and offers',
      name: 'home_sec_promo',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming events`
  String get home_sec_event {
    return Intl.message(
      'Upcoming events',
      name: 'home_sec_event',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get txt_categories {
    return Intl.message(
      'Categories',
      name: 'txt_categories',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get dtl_about {
    return Intl.message(
      'About',
      name: 'dtl_about',
      desc: '',
      args: [],
    );
  }

  /// `Opening Hours`
  String get dtl_opening {
    return Intl.message(
      'Opening Hours',
      name: 'dtl_opening',
      desc: '',
      args: [],
    );
  }

  /// `Weekday {open} - {close}`
  String dtl_weekday(Object open, Object close) {
    return Intl.message(
      'Weekday $open - $close',
      name: 'dtl_weekday',
      desc: '',
      args: [open, close],
    );
  }

  /// `Weekend {open} - {close}`
  String dtl_weekend(Object open, Object close) {
    return Intl.message(
      'Weekend $open - $close',
      name: 'dtl_weekend',
      desc: '',
      args: [open, close],
    );
  }

  /// `Location`
  String get dtl_location {
    return Intl.message(
      'Location',
      name: 'dtl_location',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number`
  String get dtl_number {
    return Intl.message(
      'Contact Number',
      name: 'dtl_number',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get home_welcome {
    return Intl.message(
      'Welcome to',
      name: 'home_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Marina World`
  String get home_mall {
    return Intl.message(
      'Marina World',
      name: 'home_mall',
      desc: '',
      args: [],
    );
  }

  /// `Marina World`
  String get about_mallname {
    return Intl.message(
      'Marina World',
      name: 'about_mallname',
      desc: '',
      args: [],
    );
  }

  /// `Marina`
  String get about_mallname_part1 {
    return Intl.message(
      'Marina',
      name: 'about_mallname_part1',
      desc: '',
      args: [],
    );
  }

  /// ` World`
  String get about_mallname_part2 {
    return Intl.message(
      ' World',
      name: 'about_mallname_part2',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get about_area {
    return Intl.message(
      'Area',
      name: 'about_area',
      desc: '',
      args: [],
    );
  }

  /// `Brands`
  String get about_brand {
    return Intl.message(
      'Brands',
      name: 'about_brand',
      desc: '',
      args: [],
    );
  }

  /// `Shops`
  String get about_shop {
    return Intl.message(
      'Shops',
      name: 'about_shop',
      desc: '',
      args: [],
    );
  }

  /// `Dining`
  String get about_dining {
    return Intl.message(
      'Dining',
      name: 'about_dining',
      desc: '',
      args: [],
    );
  }

  /// `Cafe`
  String get about_cafe {
    return Intl.message(
      'Cafe',
      name: 'about_cafe',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get about_entertainment {
    return Intl.message(
      'Entertainment',
      name: 'about_entertainment',
      desc: '',
      args: [],
    );
  }

  /// `m`
  String get about_m {
    return Intl.message(
      'm',
      name: 'about_m',
      desc: '',
      args: [],
    );
  }

  /// `No Dining`
  String get dining_empty {
    return Intl.message(
      'No Dining',
      name: 'dining_empty',
      desc: '',
      args: [],
    );
  }

  /// `Error while loading Dining`
  String get dining_error {
    return Intl.message(
      'Error while loading Dining',
      name: 'dining_error',
      desc: '',
      args: [],
    );
  }

  /// `No Stores`
  String get stores_empty {
    return Intl.message(
      'No Stores',
      name: 'stores_empty',
      desc: '',
      args: [],
    );
  }

  /// `Error while loading Stores`
  String get stores_error {
    return Intl.message(
      'Error while loading Stores',
      name: 'stores_error',
      desc: '',
      args: [],
    );
  }

  /// `No Offers`
  String get offer_empty {
    return Intl.message(
      'No Offers',
      name: 'offer_empty',
      desc: '',
      args: [],
    );
  }

  /// `No Events`
  String get event_empty {
    return Intl.message(
      'No Events',
      name: 'event_empty',
      desc: '',
      args: [],
    );
  }

  /// `Navigate`
  String get btn_navigate {
    return Intl.message(
      'Navigate',
      name: 'btn_navigate',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get btn_explore {
    return Intl.message(
      'Explore',
      name: 'btn_explore',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get btn_view_all {
    return Intl.message(
      'View All',
      name: 'btn_view_all',
      desc: '',
      args: [],
    );
  }

  /// `{floor} Floor`
  String txt_floor(Object floor) {
    return Intl.message(
      '$floor Floor',
      name: 'txt_floor',
      desc: '',
      args: [floor],
    );
  }

  /// `Locate Store`
  String get heading_search_store {
    return Intl.message(
      'Locate Store',
      name: 'heading_search_store',
      desc: '',
      args: [],
    );
  }

  /// `Locate Dining`
  String get heading_search_dinig {
    return Intl.message(
      'Locate Dining',
      name: 'heading_search_dinig',
      desc: '',
      args: [],
    );
  }

  /// `Search by name`
  String get search_hint_name {
    return Intl.message(
      'Search by name',
      name: 'search_hint_name',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get search_all_cat {
    return Intl.message(
      'All Categories',
      name: 'search_all_cat',
      desc: '',
      args: [],
    );
  }

  /// `All Locations`
  String get search_all_loc {
    return Intl.message(
      'All Locations',
      name: 'search_all_loc',
      desc: '',
      args: [],
    );
  }

  /// `All Floors`
  String get search_all_flr {
    return Intl.message(
      'All Floors',
      name: 'search_all_flr',
      desc: '',
      args: [],
    );
  }

  /// `Search your country name`
  String get search_country {
    return Intl.message(
      'Search your country name',
      name: 'search_country',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again later`
  String get error {
    return Intl.message(
      'Something went wrong. Please try again later',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get whatsapp_title {
    return Intl.message(
      'WhatsApp',
      name: 'whatsapp_title',
      desc: '',
      args: [],
    );
  }

  /// `Contact on WhatsApp`
  String get whatsapp_message {
    return Intl.message(
      'Contact on WhatsApp',
      name: 'whatsapp_message',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Make sure you have whatsapp installed in your phone`
  String get whatsapp_not_installed {
    return Intl.message(
      'Something went wrong. Make sure you have whatsapp installed in your phone',
      name: 'whatsapp_not_installed',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get heading_search_result {
    return Intl.message(
      'Search Result',
      name: 'heading_search_result',
      desc: '',
      args: [],
    );
  }

  /// `No Result`
  String get placeholder_search_empty {
    return Intl.message(
      'No Result',
      name: 'placeholder_search_empty',
      desc: '',
      args: [],
    );
  }

  /// `OFFERS`
  String get heading_offers {
    return Intl.message(
      'OFFERS',
      name: 'heading_offers',
      desc: '',
      args: [],
    );
  }

  /// `LATEST EVENTS`
  String get heading_events {
    return Intl.message(
      'LATEST EVENTS',
      name: 'heading_events',
      desc: '',
      args: [],
    );
  }

  /// `All Retailers`
  String get oh_retailer {
    return Intl.message(
      'All Retailers',
      name: 'oh_retailer',
      desc: '',
      args: [],
    );
  }

  /// `10:00 AM - 10:00 PM (Weekdays)\n10:00 AM - 11:00 PM (Weekends)`
  String get oh_retailer_time {
    return Intl.message(
      '10:00 AM - 10:00 PM (Weekdays)\n10:00 AM - 11:00 PM (Weekends)',
      name: 'oh_retailer_time',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants Inside The Mall`
  String get oh_rest {
    return Intl.message(
      'Restaurants Inside The Mall',
      name: 'oh_rest',
      desc: '',
      args: [],
    );
  }

  /// `09:00 AM - 10:00 PM`
  String get oh_rest_time {
    return Intl.message(
      '09:00 AM - 10:00 PM',
      name: 'oh_rest_time',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Cinescape`
  String get oh_movie {
    return Intl.message(
      'Cinescape',
      name: 'oh_movie',
      desc: '',
      args: [],
    );
  }

  /// `12:00 PM - Midnight`
  String get oh_movie_time {
    return Intl.message(
      '12:00 PM - Midnight',
      name: 'oh_movie_time',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants On Crescent Side`
  String get oh_hotel {
    return Intl.message(
      'Restaurants On Crescent Side',
      name: 'oh_hotel',
      desc: '',
      args: [],
    );
  }

  /// `07:00 AM - 11:00 PM`
  String get oh_hotel_time {
    return Intl.message(
      '07:00 AM - 11:00 PM',
      name: 'oh_hotel_time',
      desc: '',
      args: [],
    );
  }

  /// `Invalid DOB`
  String get DOB_empty_error {
    return Intl.message(
      'Invalid DOB',
      name: 'DOB_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `DD/MM/YYYY`
  String get DOB_hint_text {
    return Intl.message(
      'DD/MM/YYYY',
      name: 'DOB_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Search for an Country Name...`
  String get search_country_hint {
    return Intl.message(
      'Search for an Country Name...',
      name: 'search_country_hint',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get btx_share {
    return Intl.message(
      'Share',
      name: 'btx_share',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout_title {
    return Intl.message(
      'Log Out',
      name: 'logout_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want to logout from your account?`
  String get logout_msg {
    return Intl.message(
      'Are you sure want to logout from your account?',
      name: 'logout_msg',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get logout_btx_yes {
    return Intl.message(
      'Yes',
      name: 'logout_btx_yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get logout_btx_no {
    return Intl.message(
      'Cancel',
      name: 'logout_btx_no',
      desc: '',
      args: [],
    );
  }

  /// `Leasing`
  String get leasing_title {
    return Intl.message(
      'Leasing',
      name: 'leasing_title',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in maximum details and our representative will call you soon.`
  String get leasing_heading {
    return Intl.message(
      'Please fill in maximum details and our representative will call you soon.',
      name: 'leasing_heading',
      desc: '',
      args: [],
    );
  }

  /// `Leasing Opportunities With us. If you want a large audience to see your brand and buy what you have to offer, there is no better option than setting up a store at Marina Mall. We provide superior services for shopping centre leasing in Salmiya to help you get the maximum value out of your investment. Our team takes into account your specific requirements and then recommends the best way options for store leasing. We offer complete support to our clients from the start till after we get your store up and running. Shopping centre leasing in Salmiya has never been easier than at Marina Mall. Together, we will help your brand reach the highest peak of business achievements, offering our support at every step.`
  String get leasing_description {
    return Intl.message(
      'Leasing Opportunities With us. If you want a large audience to see your brand and buy what you have to offer, there is no better option than setting up a store at Marina Mall. We provide superior services for shopping centre leasing in Salmiya to help you get the maximum value out of your investment. Our team takes into account your specific requirements and then recommends the best way options for store leasing. We offer complete support to our clients from the start till after we get your store up and running. Shopping centre leasing in Salmiya has never been easier than at Marina Mall. Together, we will help your brand reach the highest peak of business achievements, offering our support at every step.',
      name: 'leasing_description',
      desc: '',
      args: [],
    );
  }

  /// `Applicant's Name`
  String get leasing_name_hint {
    return Intl.message(
      'Applicant\'s Name',
      name: 'leasing_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Area Required (approx m²)`
  String get leasing_area_hint {
    return Intl.message(
      'Area Required (approx m²)',
      name: 'leasing_area_hint',
      desc: '',
      args: [],
    );
  }

  /// `Intended Use`
  String get leasing_intended_hint {
    return Intl.message(
      'Intended Use',
      name: 'leasing_intended_hint',
      desc: '',
      args: [],
    );
  }

  /// `Brand Name`
  String get leasing_brand_hint {
    return Intl.message(
      'Brand Name',
      name: 'leasing_brand_hint',
      desc: '',
      args: [],
    );
  }

  /// ` Document/ Business Profile`
  String get leasing_file_caption {
    return Intl.message(
      ' Document/ Business Profile',
      name: 'leasing_file_caption',
      desc: '',
      args: [],
    );
  }

  /// `Choose File`
  String get leasing_file_btn {
    return Intl.message(
      'Choose File',
      name: 'leasing_file_btn',
      desc: '',
      args: [],
    );
  }

  /// `No File Choosen`
  String get leasing_file_hint {
    return Intl.message(
      'No File Choosen',
      name: 'leasing_file_hint',
      desc: '',
      args: [],
    );
  }

  /// `Contact Details`
  String get leasing_contact_caption {
    return Intl.message(
      'Contact Details',
      name: 'leasing_contact_caption',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get leasing_contact_address_hint {
    return Intl.message(
      'Address',
      name: 'leasing_contact_address_hint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get leasing_contact_phone_hint {
    return Intl.message(
      'Phone Number',
      name: 'leasing_contact_phone_hint',
      desc: '',
      args: [],
    );
  }

  /// `Fax`
  String get leasing_contact_fax_hint {
    return Intl.message(
      'Fax',
      name: 'leasing_contact_fax_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get leasing_contact_email_hint {
    return Intl.message(
      'Email Address',
      name: 'leasing_contact_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Other Locations`
  String get leasing_contact_otherloc_hint {
    return Intl.message(
      'Other Locations',
      name: 'leasing_contact_otherloc_hint',
      desc: '',
      args: [],
    );
  }

  /// `Other Businesses`
  String get leasing_contact_otherbuz_hint {
    return Intl.message(
      'Other Businesses',
      name: 'leasing_contact_otherbuz_hint',
      desc: '',
      args: [],
    );
  }

  /// `Field can't be empty`
  String get leasing_field_empty_error {
    return Intl.message(
      'Field can\'t be empty',
      name: 'leasing_field_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred while sumitting details\nPlease try again later`
  String get error_result {
    return Intl.message(
      'Error occurred while sumitting details\nPlease try again later',
      name: 'error_result',
      desc: '',
      args: [],
    );
  }

  /// `Ground Floor`
  String get floor_ground {
    return Intl.message(
      'Ground Floor',
      name: 'floor_ground',
      desc: '',
      args: [],
    );
  }

  /// `1st Floor`
  String get floor_first {
    return Intl.message(
      '1st Floor',
      name: 'floor_first',
      desc: '',
      args: [],
    );
  }

  /// `2nd Floor`
  String get floor_second {
    return Intl.message(
      '2nd Floor',
      name: 'floor_second',
      desc: '',
      args: [],
    );
  }

  /// `Floor Required`
  String get floor_required {
    return Intl.message(
      'Floor Required',
      name: 'floor_required',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your message. We have received it and a specialist from our team will contact you shortly to discuss further details about your queries.`
  String get thankyou_message_leasing {
    return Intl.message(
      'Thank you for your message. We have received it and a specialist from our team will contact you shortly to discuss further details about your queries.',
      name: 'thankyou_message_leasing',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for showing interest in Marina World`
  String get thankyou_title {
    return Intl.message(
      'Thank you for showing interest in Marina World',
      name: 'thankyou_title',
      desc: '',
      args: [],
    );
  }

  /// `Our representative will get back to you. In the meantime, feel free to explore your interest in the app and see how Marina World can bring joy to your life.`
  String get thankyou_message {
    return Intl.message(
      'Our representative will get back to you. In the meantime, feel free to explore your interest in the app and see how Marina World can bring joy to your life.',
      name: 'thankyou_message',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get btn_ok {
    return Intl.message(
      'Ok',
      name: 'btn_ok',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_title {
    return Intl.message(
      'Contact Us',
      name: 'contact_title',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the below form to connect with us.`
  String get contact_desc {
    return Intl.message(
      'Please fill in the below form to connect with us.',
      name: 'contact_desc',
      desc: '',
      args: [],
    );
  }

  /// `Connect With Us`
  String get contact_subheading {
    return Intl.message(
      'Connect With Us',
      name: 'contact_subheading',
      desc: '',
      args: [],
    );
  }

  /// `To provide feedback or suggestions, please fill in the below form to connect with us.`
  String get contact_note {
    return Intl.message(
      'To provide feedback or suggestions, please fill in the below form to connect with us.',
      name: 'contact_note',
      desc: '',
      args: [],
    );
  }

  /// `Your Full Name`
  String get contact_hint_name {
    return Intl.message(
      'Your Full Name',
      name: 'contact_hint_name',
      desc: '',
      args: [],
    );
  }

  /// `Your Phone Number`
  String get contact_hint_phone {
    return Intl.message(
      'Your Phone Number',
      name: 'contact_hint_phone',
      desc: '',
      args: [],
    );
  }

  /// `Your Email Address`
  String get contact_hint_email {
    return Intl.message(
      'Your Email Address',
      name: 'contact_hint_email',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get contact_hint_message {
    return Intl.message(
      'Message',
      name: 'contact_hint_message',
      desc: '',
      args: [],
    );
  }

  /// `Locate on Map`
  String get contact_btx_locate {
    return Intl.message(
      'Locate on Map',
      name: 'contact_btx_locate',
      desc: '',
      args: [],
    );
  }

  /// `Name can't be empty`
  String get contact_name_empty {
    return Intl.message(
      'Name can\'t be empty',
      name: 'contact_name_empty',
      desc: '',
      args: [],
    );
  }

  /// `Name can't be this short`
  String get contact_name_invalid {
    return Intl.message(
      'Name can\'t be this short',
      name: 'contact_name_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Message can't be empty`
  String get contact_message_empty {
    return Intl.message(
      'Message can\'t be empty',
      name: 'contact_message_empty',
      desc: '',
      args: [],
    );
  }

  /// `Message can't be this short`
  String get contact_message_invalid {
    return Intl.message(
      'Message can\'t be this short',
      name: 'contact_message_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get contact_info_location {
    return Intl.message(
      'Location',
      name: 'contact_info_location',
      desc: '',
      args: [],
    );
  }

  /// `Email Id`
  String get contact_info_email {
    return Intl.message(
      'Email Id',
      name: 'contact_info_email',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number`
  String get contact_info_contact {
    return Intl.message(
      'Contact Number',
      name: 'contact_info_contact',
      desc: '',
      args: [],
    );
  }

  /// `Set along Kuwait’s coastline, Marina World is a landmark mixed-use development owned by United Real Estate Company K.S.C.P (URC), located in one of Kuwait’s main shopping districts. This development is anchored by Marina Mall, a contemporary shopping mall having 165 shops. The Mall is connected by a glass-enclosed bridge to Marina Crescent, a seafront component lined with international cafes and restaurants.\n\nThe development extends along the sea front to include a walking pathway and three additional retail developments known as Marina Waves, Marina Waterfront and Marina Walk, which provide its customers with prime views of the Gulf. The Marina houses, the Marina Yacht Club, an exclusive serviced club with space of 144 berths. Overlooking the Yacht Club is Marina Hotel, a prestigious 5-star hotel situated directly on the beach with ready access to the Marina Mall and Marina Crescent. The Marina also includes the multi-function Salwa Sabah Al Ahmed Ball Room.`
  String get mall_about {
    return Intl.message(
      'Set along Kuwait’s coastline, Marina World is a landmark mixed-use development owned by United Real Estate Company K.S.C.P (URC), located in one of Kuwait’s main shopping districts. This development is anchored by Marina Mall, a contemporary shopping mall having 165 shops. The Mall is connected by a glass-enclosed bridge to Marina Crescent, a seafront component lined with international cafes and restaurants.\n\nThe development extends along the sea front to include a walking pathway and three additional retail developments known as Marina Waves, Marina Waterfront and Marina Walk, which provide its customers with prime views of the Gulf. The Marina houses, the Marina Yacht Club, an exclusive serviced club with space of 144 berths. Overlooking the Yacht Club is Marina Hotel, a prestigious 5-star hotel situated directly on the beach with ready access to the Marina Mall and Marina Crescent. The Marina also includes the multi-function Salwa Sabah Al Ahmed Ball Room.',
      name: 'mall_about',
      desc: '',
      args: [],
    );
  }

  /// `Marinal World at a `
  String get mall_about_span1 {
    return Intl.message(
      'Marinal World at a ',
      name: 'mall_about_span1',
      desc: '',
      args: [],
    );
  }

  /// `Glance`
  String get mall_about_span2 {
    return Intl.message(
      'Glance',
      name: 'mall_about_span2',
      desc: '',
      args: [],
    );
  }

  /// `Explore the most iconic destination on Kuwait’s coastline`
  String get mall_about_footer {
    return Intl.message(
      'Explore the most iconic destination on Kuwait’s coastline',
      name: 'mall_about_footer',
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
