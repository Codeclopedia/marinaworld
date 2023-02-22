// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(open, close) => "Weekday ${open} - ${close}";

  static String m1(open, close) => "Weekend ${open} - ${close}";

  static String m2(time) => "Resend OTP in ${time} seconds";

  static String m3(floor) => "${floor} Floor";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "DOB_empty_error": MessageLookupByLibrary.simpleMessage("Invalid DOB"),
        "DOB_hint_text": MessageLookupByLibrary.simpleMessage("DD/MM/YYYY"),
        "about_area": MessageLookupByLibrary.simpleMessage("Area"),
        "about_brand": MessageLookupByLibrary.simpleMessage("Brands"),
        "about_cafe": MessageLookupByLibrary.simpleMessage("Cafe"),
        "about_dining": MessageLookupByLibrary.simpleMessage("Dining"),
        "about_entertainment":
            MessageLookupByLibrary.simpleMessage("Entertainment"),
        "about_m": MessageLookupByLibrary.simpleMessage("m"),
        "about_mallname": MessageLookupByLibrary.simpleMessage("Marina World"),
        "about_mallname_part1": MessageLookupByLibrary.simpleMessage("Marina"),
        "about_mallname_part2": MessageLookupByLibrary.simpleMessage(" World"),
        "about_shop": MessageLookupByLibrary.simpleMessage("Shops"),
        "btn_explore": MessageLookupByLibrary.simpleMessage("Explore"),
        "btn_navigate": MessageLookupByLibrary.simpleMessage("Navigate"),
        "btn_ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "btn_view_all": MessageLookupByLibrary.simpleMessage("View All"),
        "btx_share": MessageLookupByLibrary.simpleMessage("Share"),
        "change_language_submit":
            MessageLookupByLibrary.simpleMessage("Submit"),
        "change_pass_caption": MessageLookupByLibrary.simpleMessage(
            "Your OTP verified successfully,\nNow Please enter new password to set password for "),
        "change_pass_title":
            MessageLookupByLibrary.simpleMessage("Reset your password"),
        "change_password":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "clang_btn_submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "clang_caption": MessageLookupByLibrary.simpleMessage("Language"),
        "clang_greeting":
            MessageLookupByLibrary.simpleMessage("Choose Language"),
        "clang_hint":
            MessageLookupByLibrary.simpleMessage("Please choose a language"),
        "clang_message": MessageLookupByLibrary.simpleMessage("Select"),
        "contact_btx_locate":
            MessageLookupByLibrary.simpleMessage("Locate on Map"),
        "contact_desc": MessageLookupByLibrary.simpleMessage(
            "Please fill in the below form to connect with us."),
        "contact_hint_email":
            MessageLookupByLibrary.simpleMessage("Your Email Address"),
        "contact_hint_message": MessageLookupByLibrary.simpleMessage("Message"),
        "contact_hint_name":
            MessageLookupByLibrary.simpleMessage("Your Full Name"),
        "contact_hint_phone":
            MessageLookupByLibrary.simpleMessage("Your Phone Number"),
        "contact_info_contact":
            MessageLookupByLibrary.simpleMessage("Contact Number"),
        "contact_info_email": MessageLookupByLibrary.simpleMessage("Email Id"),
        "contact_info_location":
            MessageLookupByLibrary.simpleMessage("Location"),
        "contact_message_empty":
            MessageLookupByLibrary.simpleMessage("Message can\'t be empty"),
        "contact_message_invalid": MessageLookupByLibrary.simpleMessage(
            "Message can\'t be this short"),
        "contact_name_empty":
            MessageLookupByLibrary.simpleMessage("Name can\'t be empty"),
        "contact_name_invalid":
            MessageLookupByLibrary.simpleMessage("Name can\'t be this short"),
        "contact_note": MessageLookupByLibrary.simpleMessage(
            "To provide feedback or suggestions, please fill in the below form to connect with us."),
        "contact_subheading":
            MessageLookupByLibrary.simpleMessage("Connect With Us"),
        "contact_title": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "contact_us_submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "dining_empty": MessageLookupByLibrary.simpleMessage("No Dining"),
        "dining_error":
            MessageLookupByLibrary.simpleMessage("Error while loading Dining"),
        "dtl_about": MessageLookupByLibrary.simpleMessage("About"),
        "dtl_location": MessageLookupByLibrary.simpleMessage("Location"),
        "dtl_number": MessageLookupByLibrary.simpleMessage("Contact Number"),
        "dtl_opening": MessageLookupByLibrary.simpleMessage("Opening Hours"),
        "dtl_weekday": m0,
        "dtl_weekend": m1,
        "edit_profile_title": MessageLookupByLibrary.simpleMessage("Profile"),
        "error": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Please try again later"),
        "error_result": MessageLookupByLibrary.simpleMessage(
            "Error occurred while sumitting details\nPlease try again later"),
        "event_empty": MessageLookupByLibrary.simpleMessage("No Events"),
        "floor_first": MessageLookupByLibrary.simpleMessage("1st Floor"),
        "floor_ground": MessageLookupByLibrary.simpleMessage("Ground Floor"),
        "floor_required":
            MessageLookupByLibrary.simpleMessage("Floor Required"),
        "floor_second": MessageLookupByLibrary.simpleMessage("2nd Floor"),
        "fp_btn_submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "fp_btx_explore": MessageLookupByLibrary.simpleMessage("Explore First"),
        "fp_btx_login_back":
            MessageLookupByLibrary.simpleMessage("Back to Login"),
        "fp_desc_message": MessageLookupByLibrary.simpleMessage(
            "Enter the email associated with your account and we\'ll send an email with instructions to reset your password."),
        "fp_desc_mobile_message": MessageLookupByLibrary.simpleMessage(
            "Enter the mobile number associated with your account and we\'ll send an otp to reset your password."),
        "fp_email_caption":
            MessageLookupByLibrary.simpleMessage("Email Address"),
        "fp_email_empty": MessageLookupByLibrary.simpleMessage(
            "Email address can\'t be empty"),
        "fp_email_hint":
            MessageLookupByLibrary.simpleMessage("Enter Your Email Address"),
        "fp_email_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid Email Address"),
        "fp_header_title":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "heading_events": MessageLookupByLibrary.simpleMessage("LATEST EVENTS"),
        "heading_offers": MessageLookupByLibrary.simpleMessage("OFFERS"),
        "heading_search_dinig":
            MessageLookupByLibrary.simpleMessage("Locate Dining"),
        "heading_search_result":
            MessageLookupByLibrary.simpleMessage("Search Result"),
        "heading_search_store":
            MessageLookupByLibrary.simpleMessage("Locate Store"),
        "home_mall": MessageLookupByLibrary.simpleMessage("Marina World"),
        "home_sec_brand":
            MessageLookupByLibrary.simpleMessage("Truly Great Brands"),
        "home_sec_category":
            MessageLookupByLibrary.simpleMessage("Browse by category"),
        "home_sec_dining": MessageLookupByLibrary.simpleMessage("Dining"),
        "home_sec_event":
            MessageLookupByLibrary.simpleMessage("Upcoming events"),
        "home_sec_promo":
            MessageLookupByLibrary.simpleMessage("Promotions and offers"),
        "home_welcome": MessageLookupByLibrary.simpleMessage("Welcome to"),
        "leasing_area_hint":
            MessageLookupByLibrary.simpleMessage("Area Required (approx m²)"),
        "leasing_brand_hint":
            MessageLookupByLibrary.simpleMessage("Brand Name"),
        "leasing_contact_address_hint":
            MessageLookupByLibrary.simpleMessage("Address"),
        "leasing_contact_caption":
            MessageLookupByLibrary.simpleMessage("Contact Details"),
        "leasing_contact_email_hint":
            MessageLookupByLibrary.simpleMessage("Email Address"),
        "leasing_contact_fax_hint": MessageLookupByLibrary.simpleMessage("Fax"),
        "leasing_contact_otherbuz_hint":
            MessageLookupByLibrary.simpleMessage("Other Businesses"),
        "leasing_contact_otherloc_hint":
            MessageLookupByLibrary.simpleMessage("Other Locations"),
        "leasing_contact_phone_hint":
            MessageLookupByLibrary.simpleMessage("Phone Number"),
        "leasing_description": MessageLookupByLibrary.simpleMessage(
            "Leasing Opportunities With us. If you want a large audience to see your brand and buy what you have to offer, there is no better option than setting up a store at Marina Mall. We provide superior services for shopping centre leasing in Salmiya to help you get the maximum value out of your investment. Our team takes into account your specific requirements and then recommends the best way options for store leasing. We offer complete support to our clients from the start till after we get your store up and running. Shopping centre leasing in Salmiya has never been easier than at Marina Mall. Together, we will help your brand reach the highest peak of business achievements, offering our support at every step."),
        "leasing_field_empty_error":
            MessageLookupByLibrary.simpleMessage("Field can\'t be empty"),
        "leasing_file_btn": MessageLookupByLibrary.simpleMessage("Choose File"),
        "leasing_file_caption":
            MessageLookupByLibrary.simpleMessage(" Document/ Business Profile"),
        "leasing_file_hint":
            MessageLookupByLibrary.simpleMessage("No File Choosen"),
        "leasing_heading": MessageLookupByLibrary.simpleMessage(
            "Please fill in maximum details and our representative will call you soon."),
        "leasing_intended_hint":
            MessageLookupByLibrary.simpleMessage("Intended Use"),
        "leasing_name_hint":
            MessageLookupByLibrary.simpleMessage("Applicant\'s Name"),
        "leasing_title": MessageLookupByLibrary.simpleMessage("Leasing"),
        "location": MessageLookupByLibrary.simpleMessage(
            "Salem Mubarak Street, Gulf Road, Kuwait"),
        "login_btn_signin": MessageLookupByLibrary.simpleMessage("Login"),
        "login_btx_forgot_password_":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "login_btx_login_faceid":
            MessageLookupByLibrary.simpleMessage("Login with Face ID"),
        "login_btx_login_otp":
            MessageLookupByLibrary.simpleMessage("Login with OTP"),
        "login_btx_login_password":
            MessageLookupByLibrary.simpleMessage("Login with Password"),
        "login_btx_signup": MessageLookupByLibrary.simpleMessage(" Sign Up "),
        "login_check_remember":
            MessageLookupByLibrary.simpleMessage("Remember Me"),
        "login_footer_no_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "login_greetings":
            MessageLookupByLibrary.simpleMessage("Hi, Welcome Back! 👋"),
        "login_message":
            MessageLookupByLibrary.simpleMessage("Login to your Account"),
        "login_password_caption":
            MessageLookupByLibrary.simpleMessage("Password"),
        "login_password_empty":
            MessageLookupByLibrary.simpleMessage("Password can\'t be empty"),
        "login_password_hint":
            MessageLookupByLibrary.simpleMessage("Please Enter Your Password"),
        "login_password_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid Password"),
        "login_username_caption":
            MessageLookupByLibrary.simpleMessage("Username"),
        "login_username_empty":
            MessageLookupByLibrary.simpleMessage("Username can\'t be empty"),
        "login_username_hint":
            MessageLookupByLibrary.simpleMessage("Please Enter Your Username"),
        "login_username_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid Username"),
        "logout_btx_no": MessageLookupByLibrary.simpleMessage("Cancel"),
        "logout_btx_yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "logout_msg": MessageLookupByLibrary.simpleMessage(
            "Are you sure want to logout from your account?"),
        "logout_title": MessageLookupByLibrary.simpleMessage("Log Out"),
        "mall_about": MessageLookupByLibrary.simpleMessage(
            "Set along Kuwait’s coastline, Marina World is a landmark mixed-use development owned by United Real Estate Company K.S.C.P (URC), located in one of Kuwait’s main shopping districts. This development is anchored by Marina Mall, a contemporary shopping mall having 165 shops. The Mall is connected by a glass-enclosed bridge to Marina Crescent, a seafront component lined with international cafes and restaurants.\n\nThe development extends along the sea front to include a walking pathway and three additional retail developments known as Marina Waves, Marina Waterfront and Marina Walk, which provide its customers with prime views of the Gulf. The Marina houses, the Marina Yacht Club, an exclusive serviced club with space of 144 berths. Overlooking the Yacht Club is Marina Hotel, a prestigious 5-star hotel situated directly on the beach with ready access to the Marina Mall and Marina Crescent. The Marina also includes the multi-function Salwa Sabah Al Ahmed Ball Room."),
        "mall_about_footer": MessageLookupByLibrary.simpleMessage(
            "Explore the most iconic destination on Kuwait’s coastline"),
        "mall_about_span1":
            MessageLookupByLibrary.simpleMessage("Marinal World at a "),
        "mall_about_span2": MessageLookupByLibrary.simpleMessage("Glance"),
        "menu_about_us": MessageLookupByLibrary.simpleMessage("About us"),
        "menu_choose_lang":
            MessageLookupByLibrary.simpleMessage("Change Language"),
        "menu_contact": MessageLookupByLibrary.simpleMessage("Contact"),
        "menu_dining": MessageLookupByLibrary.simpleMessage("Dining"),
        "menu_events": MessageLookupByLibrary.simpleMessage("Events"),
        "menu_gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "menu_leasing": MessageLookupByLibrary.simpleMessage("Leasing"),
        "menu_logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "menu_offers":
            MessageLookupByLibrary.simpleMessage("Offers and Promotions"),
        "menu_opening_hr":
            MessageLookupByLibrary.simpleMessage("Opening hours"),
        "menu_stores": MessageLookupByLibrary.simpleMessage("Stores"),
        "msg_otp_sent":
            MessageLookupByLibrary.simpleMessage("OTP sent successfully"),
        "msg_unknown_error":
            MessageLookupByLibrary.simpleMessage("Unknown Error"),
        "nav_home": MessageLookupByLibrary.simpleMessage("Home"),
        "nav_map": MessageLookupByLibrary.simpleMessage("Mall Map"),
        "offer_empty": MessageLookupByLibrary.simpleMessage("No Offers"),
        "oh_hotel": MessageLookupByLibrary.simpleMessage(
            "Restaurants On Crescent Side"),
        "oh_hotel_time":
            MessageLookupByLibrary.simpleMessage("07:00 AM - 11:00 PM"),
        "oh_movie": MessageLookupByLibrary.simpleMessage("Cinescape"),
        "oh_movie_time":
            MessageLookupByLibrary.simpleMessage("12:00 PM - Midnight"),
        "oh_rest":
            MessageLookupByLibrary.simpleMessage("Restaurants Inside The Mall"),
        "oh_rest_time":
            MessageLookupByLibrary.simpleMessage("09:00 AM - 10:00 PM"),
        "oh_retailer": MessageLookupByLibrary.simpleMessage("All Retailers"),
        "oh_retailer_time": MessageLookupByLibrary.simpleMessage(
            "10:00 AM - 10:00 PM (Weekdays)\n10:00 AM - 11:00 PM (Weekends)"),
        "otp_login_btn_resend":
            MessageLookupByLibrary.simpleMessage("Resend OTP"),
        "otp_login_btn_send": MessageLookupByLibrary.simpleMessage("Send OTP"),
        "otp_login_btn_verify":
            MessageLookupByLibrary.simpleMessage("Verify OTP"),
        "otp_login_header_title":
            MessageLookupByLibrary.simpleMessage("Login with OTP"),
        "otp_login_mobile_caption":
            MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "otp_login_otp_caption":
            MessageLookupByLibrary.simpleMessage("Enter OTP"),
        "otp_login_txt_in_seconds": m2,
        "placeholder_search_empty":
            MessageLookupByLibrary.simpleMessage("No Result"),
        "search_all_cat":
            MessageLookupByLibrary.simpleMessage("All Categories"),
        "search_all_flr": MessageLookupByLibrary.simpleMessage("All Floors"),
        "search_all_loc": MessageLookupByLibrary.simpleMessage("All Locations"),
        "search_country":
            MessageLookupByLibrary.simpleMessage("Search your country name"),
        "search_country_hint": MessageLookupByLibrary.simpleMessage(
            "Search for an Country Name..."),
        "search_hint_name":
            MessageLookupByLibrary.simpleMessage("Search by name"),
        "signup_btn_create_account":
            MessageLookupByLibrary.simpleMessage("Create Account"),
        "signup_btx_signin": MessageLookupByLibrary.simpleMessage(" Sign In "),
        "signup_cnf_password_caption":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "signup_cnf_password_empty": MessageLookupByLibrary.simpleMessage(
            "Confirm Password can\'t be empty"),
        "signup_cnf_password_hint": MessageLookupByLibrary.simpleMessage(
            "Please enter Confirm password"),
        "signup_cnf_password_invalid": MessageLookupByLibrary.simpleMessage(
            "Confirm password should match with password"),
        "signup_dob_caption":
            MessageLookupByLibrary.simpleMessage("Date of Birth"),
        "signup_dob_hint": MessageLookupByLibrary.simpleMessage("MM/DD/YYYY"),
        "signup_email_caption": MessageLookupByLibrary.simpleMessage("Email"),
        "signup_email_empty": MessageLookupByLibrary.simpleMessage(
            "Email address can\'t be empty"),
        "signup_email_hint": MessageLookupByLibrary.simpleMessage(
            "Please Enter Your Email Address"),
        "signup_email_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid Email address"),
        "signup_footer_have_account":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "signup_gender_caption": MessageLookupByLibrary.simpleMessage("Gender"),
        "signup_gender_hint":
            MessageLookupByLibrary.simpleMessage("Select a gender"),
        "signup_gender_option_female":
            MessageLookupByLibrary.simpleMessage("Female"),
        "signup_gender_option_male":
            MessageLookupByLibrary.simpleMessage("Male"),
        "signup_gender_option_other":
            MessageLookupByLibrary.simpleMessage("Other"),
        "signup_greetings":
            MessageLookupByLibrary.simpleMessage("Create an account"),
        "signup_message":
            MessageLookupByLibrary.simpleMessage("Sign up for a new account"),
        "signup_mobile_caption":
            MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "signup_mobile_empty": MessageLookupByLibrary.simpleMessage(
            "Mobile Number can\'t be empty"),
        "signup_mobile_hint": MessageLookupByLibrary.simpleMessage(
            "Please enter your Mobile number"),
        "signup_mobile_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid Mobile number"),
        "signup_name_caption":
            MessageLookupByLibrary.simpleMessage("Full Name"),
        "signup_nationality_caption":
            MessageLookupByLibrary.simpleMessage("Nationality"),
        "signup_nationality_hint": MessageLookupByLibrary.simpleMessage(
            "Please choose your Nationality"),
        "signup_password_caption":
            MessageLookupByLibrary.simpleMessage("Password"),
        "signup_password_empty":
            MessageLookupByLibrary.simpleMessage("Password can\'t be empty"),
        "signup_password_hint":
            MessageLookupByLibrary.simpleMessage("Please enter new password"),
        "signup_password_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid Password"),
        "stores_empty": MessageLookupByLibrary.simpleMessage("No Stores"),
        "stores_error":
            MessageLookupByLibrary.simpleMessage("Error while loading Stores"),
        "thankyou_message": MessageLookupByLibrary.simpleMessage(
            "Our representative will get back to you. In the meantime, feel free to explore your interest in the app and see how Marina World can bring joy to your life."),
        "thankyou_message_leasing": MessageLookupByLibrary.simpleMessage(
            "Thank you for your message. We have received it and a specialist from our team will contact you shortly to discuss further details about your queries."),
        "thankyou_title": MessageLookupByLibrary.simpleMessage(
            "Thank you for showing interest in Marina World"),
        "txt_categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "txt_floor": m3,
        "verifyotp_back":
            MessageLookupByLibrary.simpleMessage("Back to sign up"),
        "verifyotp_btn_submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "verifyotp_btx_resend_otp":
            MessageLookupByLibrary.simpleMessage("Resend OTP"),
        "verifyotp_error_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid OTP entered"),
        "verifyotp_greeting":
            MessageLookupByLibrary.simpleMessage("OTP verification"),
        "verifyotp_message": MessageLookupByLibrary.simpleMessage("Verify"),
        "verifyotp_otp_caption":
            MessageLookupByLibrary.simpleMessage("Enter the OTP"),
        "verifyotp_txt_wait":
            MessageLookupByLibrary.simpleMessage("Resend OTP in 59 Seconds"),
        "whatsapp_message":
            MessageLookupByLibrary.simpleMessage("Contact on WhatsApp"),
        "whatsapp_not_installed": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Make sure you have whatsapp installed in your phone"),
        "whatsapp_title": MessageLookupByLibrary.simpleMessage("WhatsApp")
      };
}
