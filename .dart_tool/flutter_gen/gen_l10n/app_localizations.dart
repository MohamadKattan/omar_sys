import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'omar_system'**
  String get appTitle;

  /// noInternetConnection
  ///
  /// In en, this message translates to:
  /// **'It seems that you are not connected to the Internet, please check and try again.'**
  String get noInternetConnection;

  /// againToExit
  ///
  /// In en, this message translates to:
  /// **'Press again to exit the application'**
  String get againToExit;

  /// lastOffers
  ///
  /// In en, this message translates to:
  /// **'Featured Courses'**
  String get lastOffers;

  /// lastProduct
  ///
  /// In en, this message translates to:
  /// **'Latest Courses'**
  String get lastProduct;

  /// restFilter
  ///
  /// In en, this message translates to:
  /// **'Reset filter'**
  String get restFilter;

  /// subCat
  ///
  /// In en, this message translates to:
  /// **'SubCat'**
  String get subCat;

  /// priceLimit
  ///
  /// In en, this message translates to:
  /// **'Price range'**
  String get priceLimit;

  /// from
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// to
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// filterResult
  ///
  /// In en, this message translates to:
  /// **'Filter results'**
  String get filterResult;

  /// futProduct
  ///
  /// In en, this message translates to:
  /// **'Featured Courses'**
  String get futProduct;

  /// connectedToTheInternet
  ///
  /// In en, this message translates to:
  /// **'Connected To The Internet'**
  String get connectedToTheInternet;

  /// choseCurrency
  ///
  /// In en, this message translates to:
  /// **'Choose currency'**
  String get choseCurrency;

  /// choseLang
  ///
  /// In en, this message translates to:
  /// **'Choose the language'**
  String get choseLang;

  /// editProfile
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// areYouSure
  ///
  /// In en, this message translates to:
  /// **'Are you sure'**
  String get areYouSure;

  /// doYouWantToOutOfPage
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit the page'**
  String get doYouWantToOutOfPage;

  /// yes
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// no
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// editingYourProfile
  ///
  /// In en, this message translates to:
  /// **'Editing your profile..'**
  String get editingYourProfile;

  /// update
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// profileUpdateSuccessfully
  ///
  /// In en, this message translates to:
  /// **'The profile has been modified successfully..'**
  String get profileUpdateSuccessfully;

  /// somethingsWrong
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.. Please check the entered information and try again'**
  String get somethingsWrong;

  /// somethingsWrongTryAgain
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again..'**
  String get somethingsWrongTryAgain;

  /// pleaseConfirmEmailToUseApp
  ///
  /// In en, this message translates to:
  /// **'Please confirm your email to be able use app'**
  String get pleaseConfirmEmailToUseApp;

  /// pleaseConfirmEmail
  ///
  /// In en, this message translates to:
  /// **'\'Please confirm your email\''**
  String get pleaseConfirmEmail;

  /// confirmEmailSent
  ///
  /// In en, this message translates to:
  /// **'We have sent an email to your email with the verification code'**
  String get confirmEmailSent;

  /// confirmYourAccountNow
  ///
  /// In en, this message translates to:
  /// **'Confirm Account Now'**
  String get confirmYourAccountNow;

  /// confirmNow
  ///
  /// In en, this message translates to:
  /// **'Confirm now'**
  String get confirmNow;

  /// yourAccountUnconfirmed
  ///
  /// In en, this message translates to:
  /// **'Your account is not confirmed'**
  String get yourAccountUnconfirmed;

  /// yourAccountUnconfirmed
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// myAddress
  ///
  /// In en, this message translates to:
  /// **'My Address'**
  String get myAddress;

  /// appLanguage
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguage;

  /// appCurrency
  ///
  /// In en, this message translates to:
  /// **'App Currency'**
  String get appCurrency;

  /// changePassword
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// youCanChangePasswordFromHere
  ///
  /// In en, this message translates to:
  /// **'You can change your account password from here'**
  String get youCanChangePasswordFromHere;

  /// yourSessionHasExpiredPleaseLogin
  ///
  /// In en, this message translates to:
  /// **'Your session has expired Please login again..'**
  String get yourSessionHasExpiredPleaseLogin;

  /// searchResult
  ///
  /// In en, this message translates to:
  /// **'Search results'**
  String get searchResult;

  /// startSearching
  ///
  /// In en, this message translates to:
  /// **'Start a search'**
  String get startSearching;

  /// searchForProduct
  ///
  /// In en, this message translates to:
  /// **'Search for Courses'**
  String get searchForProduct;

  /// noResultForThisSearch
  ///
  /// In en, this message translates to:
  /// **'No results for this search'**
  String get noResultForThisSearch;

  /// noMoreToSeeHere
  ///
  /// In en, this message translates to:
  /// **'** There\'s no more to show here **'**
  String get noMoreToSeeHere;

  /// showPassword
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// rememberMe
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// passwordChangedSuccessfully
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangedSuccessfully;

  /// pleaseEnterPass
  ///
  /// In en, this message translates to:
  /// **'Please enter the password'**
  String get pleaseEnterPass;

  /// passWord
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passWord;

  /// enterYourPass
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPass;

  /// confirmYourPassAgain
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmYourPassAgain;

  /// enterYourPassAgain
  ///
  /// In en, this message translates to:
  /// **'Enter your password again'**
  String get enterYourPassAgain;

  /// pleaseConfirmNewPass
  ///
  /// In en, this message translates to:
  /// **'Please confirm the new password.'**
  String get pleaseConfirmNewPass;

  /// passwordUnMatch
  ///
  /// In en, this message translates to:
  /// **'Password does not match'**
  String get passwordUnMatch;

  /// confirmNewPassword
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmNewPassword;

  /// enterNewPassAgain
  ///
  /// In en, this message translates to:
  /// **'Enter the new password again'**
  String get enterNewPassAgain;

  /// pleaseEnterNewPassAgain
  ///
  /// In en, this message translates to:
  /// **'Please enter the new password'**
  String get pleaseEnterNewPassAgain;

  /// passMustContainEight
  ///
  /// In en, this message translates to:
  /// **'The password is too short, it must contain at least 8 letters and numbers'**
  String get passMustContainEight;

  /// newPass
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPass;

  /// enterNewPass
  ///
  /// In en, this message translates to:
  /// **'Enter the new password'**
  String get enterNewPass;

  /// pleaseEnterOldPass
  ///
  /// In en, this message translates to:
  /// **'Please enter the old password'**
  String get pleaseEnterOldPass;

  /// oldPassword
  ///
  /// In en, this message translates to:
  /// **'Old password'**
  String get oldPassword;

  /// enterYourOldPassword
  ///
  /// In en, this message translates to:
  /// **'Enter your old password'**
  String get enterYourOldPassword;

  /// choseAddress
  ///
  /// In en, this message translates to:
  /// **'Chose Address'**
  String get choseAddress;

  /// useMyAddress
  ///
  /// In en, this message translates to:
  /// **'Use My Address'**
  String get useMyAddress;

  /// chosePaymentMethod
  ///
  /// In en, this message translates to:
  /// **'Chose Payment Method'**
  String get chosePaymentMethod;

  /// byCustomerService
  ///
  /// In en, this message translates to:
  /// **'By Customer Service'**
  String get byCustomerService;

  /// debitMasterCard
  ///
  /// In en, this message translates to:
  /// **'Debit / MasterCard'**
  String get debitMasterCard;

  /// confirmOrder
  ///
  /// In en, this message translates to:
  /// **'Confirm Order'**
  String get confirmOrder;

  /// ordering
  ///
  /// In en, this message translates to:
  /// **'The order is completed..'**
  String get ordering;

  /// orderDoneSuccess
  ///
  /// In en, this message translates to:
  /// **'The order was completed successfully..'**
  String get orderDoneSuccess;

  /// somethingsWrongWithOrder
  ///
  /// In en, this message translates to:
  /// **'An error occurred while completing your order.. Please check the entered information and try again'**
  String get somethingsWrongWithOrder;

  /// No description provided for @thanksForOrdering.
  ///
  /// In en, this message translates to:
  /// **'Thanks for ordering'**
  String get thanksForOrdering;

  /// yourOrderHasBeenRegistered
  ///
  /// In en, this message translates to:
  /// **'Your order has been registered, it will be processed and shipped to you as soon as possible'**
  String get yourOrderHasBeenRegistered;

  /// lastName
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// firstName
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// pleaseEnterUserName
  ///
  /// In en, this message translates to:
  /// **'Please enter the user name'**
  String get pleaseEnterUserName;

  /// userName
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get userName;

  /// enterUserName
  ///
  /// In en, this message translates to:
  /// **'Enter the username'**
  String get enterUserName;

  /// pleaseEnterSubjectTitle
  ///
  /// In en, this message translates to:
  /// **'Please enter a subject title'**
  String get pleaseEnterSubjectTitle;

  /// subject
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// subjectTitle
  ///
  /// In en, this message translates to:
  /// **'Please enter a topic title'**
  String get subjectTitle;

  /// pleaseEnterMessageContent
  ///
  /// In en, this message translates to:
  /// **'Please enter the message text'**
  String get pleaseEnterMessageContent;

  /// messageContent
  ///
  /// In en, this message translates to:
  /// **'Your Message Content'**
  String get messageContent;

  /// enterMessageContent
  ///
  /// In en, this message translates to:
  /// **'Enter the description of your problem or request'**
  String get enterMessageContent;

  /// pleaseEnterAddress
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid address'**
  String get pleaseEnterAddress;

  /// address
  ///
  /// In en, this message translates to:
  /// **'address'**
  String get address;

  /// addYourAddressInDetails
  ///
  /// In en, this message translates to:
  /// **'Enter your address in detail'**
  String get addYourAddressInDetails;

  /// pleaseEnterCountry
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid country name'**
  String get pleaseEnterCountry;

  /// country
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// enterCountry
  ///
  /// In en, this message translates to:
  /// **'Enter the name of the country'**
  String get enterCountry;

  /// pleaseEnterState
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid State name'**
  String get pleaseEnterState;

  /// state
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// enterState
  ///
  /// In en, this message translates to:
  /// **'Enter the name of the State'**
  String get enterState;

  /// pleaseEnterCity
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid city name'**
  String get pleaseEnterCity;

  /// city
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// enterCity
  ///
  /// In en, this message translates to:
  /// **'Enter the name of the city'**
  String get enterCity;

  /// pleaseEnterZipCode
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid zip code'**
  String get pleaseEnterZipCode;

  /// zipCode
  ///
  /// In en, this message translates to:
  /// **'Zip code'**
  String get zipCode;

  /// enterZipCode
  ///
  /// In en, this message translates to:
  /// **'Enter the Zip Code'**
  String get enterZipCode;

  /// enterPhoneNumber
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get enterPhoneNumber;

  /// pleasePhoneNumber
  ///
  /// In en, this message translates to:
  /// **'Please type the number without 0 or the country code'**
  String get pleasePhoneNumber;

  /// pleaseEnterEmail
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterEmail;

  /// pleaseEnterValidEmail
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get pleaseEnterValidEmail;

  /// email
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get email;

  /// enterYourEmail
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// contactUs
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// contactUsDes
  ///
  /// In en, this message translates to:
  /// **'Do you have any additional request \n or face any problem while using the application?'**
  String get contactUsDes;

  /// weWillContactYou
  ///
  /// In en, this message translates to:
  /// **'Register your request or problem and our team will contact you within 24 hours'**
  String get weWillContactYou;

  /// thanksForContact
  ///
  /// In en, this message translates to:
  /// **'Thank you for your interest in contacting us'**
  String get thanksForContact;

  /// sendRequest
  ///
  /// In en, this message translates to:
  /// **'Send the request'**
  String get sendRequest;

  /// sendRequestSuccessfully
  ///
  /// In en, this message translates to:
  /// **'Your request has been successfully sent.. We will contact you shortly'**
  String get sendRequestSuccessfully;

  /// forgetYourPassword
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgetYourPassword;

  /// forgetYourPasswordDes
  ///
  /// In en, this message translates to:
  /// **'Enter your email\n and we will send a link to reset your password'**
  String get forgetYourPasswordDes;

  /// continues
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continues;

  /// restPasswordEmailSent
  ///
  /// In en, this message translates to:
  /// **'A message has been sent to your email with a link to reset your password'**
  String get restPasswordEmailSent;

  /// restPasswordEmailDidntSent
  ///
  /// In en, this message translates to:
  /// **'Your email is not already registered with us, or you entered the wrong way, please check and try again'**
  String get restPasswordEmailDidntSent;

  /// noAccount
  ///
  /// In en, this message translates to:
  /// **'Do not have an account?'**
  String get noAccount;

  /// makeNewAccount
  ///
  /// In en, this message translates to:
  /// **'Register a new account'**
  String get makeNewAccount;

  /// confirmAccount
  ///
  /// In en, this message translates to:
  /// **'Confirm account'**
  String get confirmAccount;

  /// enterOpt
  ///
  /// In en, this message translates to:
  /// **'Please enter the verification code'**
  String get enterOpt;

  /// shortOpt
  ///
  /// In en, this message translates to:
  /// **'Verification code is too short, must contain at least 6 digits'**
  String get shortOpt;

  /// opt
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get opt;

  /// signIn
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// createAccount
  ///
  /// In en, this message translates to:
  /// **'Register a new account'**
  String get createAccount;

  /// makeSurePassANdEmail
  ///
  /// In en, this message translates to:
  /// **'Please make sure that the email and password are correct'**
  String get makeSurePassANdEmail;

  /// description
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// variables
  ///
  /// In en, this message translates to:
  /// **'Available options'**
  String get variables;

  /// total
  ///
  /// In en, this message translates to:
  /// **'Total RESULT '**
  String get total;

  /// checkOut
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get checkOut;

  /// quantity
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// availableQuantity
  ///
  /// In en, this message translates to:
  /// **'Available Quantity'**
  String get availableQuantity;

  /// maxAvailableQuantity
  ///
  /// In en, this message translates to:
  /// **'This is the largest amount of this Courses currently available'**
  String get maxAvailableQuantity;

  /// addedToCard
  ///
  /// In en, this message translates to:
  /// **'Added to cart successfully'**
  String get addedToCard;

  /// addToCard
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addToCard;

  /// goToCart
  ///
  /// In en, this message translates to:
  /// **'Go to cart'**
  String get goToCart;

  /// continueShopping
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get continueShopping;

  /// youMustSignINToAddCard
  ///
  /// In en, this message translates to:
  /// **'You must be logged in to be able to add to cart'**
  String get youMustSignINToAddCard;

  /// reviews
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// relatedProduct
  ///
  /// In en, this message translates to:
  /// **'Similar Courses'**
  String get relatedProduct;

  /// noProduct
  ///
  /// In en, this message translates to:
  /// **'Something went wrong or the Courses you are looking for is not available, please try again or contact us directly .. Thank you for your understanding'**
  String get noProduct;

  /// notSignInYet
  ///
  /// In en, this message translates to:
  /// **'You are not logged in yet'**
  String get notSignInYet;

  /// signInOrSignUpToStart
  ///
  /// In en, this message translates to:
  /// **'Sign in or create a new account to start shopping'**
  String get signInOrSignUpToStart;

  /// noCatToShow
  ///
  /// In en, this message translates to:
  /// **'There are no categories to display here'**
  String get noCatToShow;

  /// noProductToShow
  ///
  /// In en, this message translates to:
  /// **'No Courses to display here'**
  String get noProductToShow;

  /// noProductToShowDes
  ///
  /// In en, this message translates to:
  /// **'You seem using a very small search scope'**
  String get noProductToShowDes;

  /// showMore
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get showMore;

  /// orderId
  ///
  /// In en, this message translates to:
  /// **'Order Id:'**
  String get orderId;

  /// orderTime
  ///
  /// In en, this message translates to:
  /// **'Order Time :'**
  String get orderTime;

  /// paymentMethod
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// shippingAddress
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shippingAddress;

  /// shippingPrice
  ///
  /// In en, this message translates to:
  /// **'Shipping Price:'**
  String get shippingPrice;

  /// status
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get status;

  /// orderDetails
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// seller
  ///
  /// In en, this message translates to:
  /// **'Seller :'**
  String get seller;

  /// termsConditions
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditions;

  /// adWithUs
  ///
  /// In en, this message translates to:
  /// **'Advertise with us'**
  String get adWithUs;

  /// whoWeAre
  ///
  /// In en, this message translates to:
  /// **'Who We Are'**
  String get whoWeAre;

  /// welcomeAgain
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeAgain;

  /// welcomeAgainDes
  ///
  /// In en, this message translates to:
  /// **'Register by entering your email address and password'**
  String get welcomeAgainDes;

  /// createNewAccount
  ///
  /// In en, this message translates to:
  /// **'Register a new account'**
  String get createNewAccount;

  /// createNewAccountDes
  ///
  /// In en, this message translates to:
  /// **'Register a new account by entering your email and password'**
  String get createNewAccountDes;

  /// termsConditionsAccept
  ///
  /// In en, this message translates to:
  /// **'When you sign up you agree to\n our Privacy Policy'**
  String get termsConditionsAccept;

  /// unitPrice
  ///
  /// In en, this message translates to:
  /// **'Unit price :'**
  String get unitPrice;

  /// totalPrice
  ///
  /// In en, this message translates to:
  /// **'Total price :'**
  String get totalPrice;

  /// shoppingBag
  ///
  /// In en, this message translates to:
  /// **'Shopping Bag'**
  String get shoppingBag;

  /// signInToStartAddToCard
  ///
  /// In en, this message translates to:
  /// **'Welcome.. Log in to be able to add to cart'**
  String get signInToStartAddToCard;

  /// emptyShopCard
  ///
  /// In en, this message translates to:
  /// **'You haven\'t added any items to cart yet'**
  String get emptyShopCard;

  /// setting
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// changePass
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePass;

  /// signOut
  ///
  /// In en, this message translates to:
  /// **'SignOut'**
  String get signOut;

  /// editAddress
  ///
  /// In en, this message translates to:
  /// **'Edit address'**
  String get editAddress;

  /// editingAddress
  ///
  /// In en, this message translates to:
  /// **'Editing address..'**
  String get editingAddress;

  /// editingAddressDone
  ///
  /// In en, this message translates to:
  /// **'Address has been modified successfully..'**
  String get editingAddressDone;

  /// showDetails
  ///
  /// In en, this message translates to:
  /// **'Show Details'**
  String get showDetails;

  /// categories
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// account
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// myCourses
  ///
  /// In en, this message translates to:
  /// **'My Courses'**
  String get myCourses;

  /// cart
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// newAccountTitle
  ///
  /// In en, this message translates to:
  /// **'Develop your skills from anywhere!'**
  String get newAccountTitle;

  /// newAccountDes
  ///
  /// In en, this message translates to:
  /// **'Log in to get started'**
  String get newAccountDes;

  /// newAccount
  ///
  /// In en, this message translates to:
  /// **'New Account'**
  String get newAccount;

  /// whatAreLookingFor
  ///
  /// In en, this message translates to:
  /// **'What are you looking for ?'**
  String get whatAreLookingFor;

  /// featuredCourses
  ///
  /// In en, this message translates to:
  /// **'Featured Courses'**
  String get featuredCourses;

  /// newCourses
  ///
  /// In en, this message translates to:
  /// **'New Courses'**
  String get newCourses;

  /// liveCourses
  ///
  /// In en, this message translates to:
  /// **'Live Courses'**
  String get liveCourses;

  /// blogPosts
  ///
  /// In en, this message translates to:
  /// **'Blog Posts'**
  String get blogPosts;

  /// readMore
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// live
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get live;

  /// weHaveProblem
  ///
  /// In en, this message translates to:
  /// **'Looks like we\'re having a problem right now, please try again later'**
  String get weHaveProblem;

  /// coursesList
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get coursesList;

  /// weHaveErrorMsg
  ///
  /// In en, this message translates to:
  /// **'Looks like we\'re having a problem right now'**
  String get weHaveErrorMsg;

  /// weHaveErrorDes
  ///
  /// In en, this message translates to:
  /// **'It is possible that there is a problem or that the platform is currently under maintenance, try again by refreshing the page shortly, thank you for your understanding'**
  String get weHaveErrorDes;

  /// coursesDetails
  ///
  /// In en, this message translates to:
  /// **'Course details'**
  String get coursesDetails;

  /// thisCoursesDetails
  ///
  /// In en, this message translates to:
  /// **'about this course?'**
  String get thisCoursesDetails;

  /// requirements
  ///
  /// In en, this message translates to:
  /// **'Attendance requirements ?'**
  String get requirements;

  /// benefits
  ///
  /// In en, this message translates to:
  /// **'Benefit from the course?'**
  String get benefits;

  /// certificate
  ///
  /// In en, this message translates to:
  /// **'Completion certificate'**
  String get certificate;

  /// liveLecture
  ///
  /// In en, this message translates to:
  /// **'Live lectures'**
  String get liveLecture;

  /// liveAndRecordedLecture
  ///
  /// In en, this message translates to:
  /// **'Recorded and live lectures'**
  String get liveAndRecordedLecture;

  /// recordedLecture
  ///
  /// In en, this message translates to:
  /// **'Recorded lectures'**
  String get recordedLecture;

  /// lecture
  ///
  /// In en, this message translates to:
  /// **'Lectures'**
  String get lecture;

  /// lectureList
  ///
  /// In en, this message translates to:
  /// **'Course topics'**
  String get lectureList;

  /// relatedCourse
  ///
  /// In en, this message translates to:
  /// **'Related courses'**
  String get relatedCourse;

  /// noCourseRegisterYet
  ///
  /// In en, this message translates to:
  /// **'You have not yet registered for any course'**
  String get noCourseRegisterYet;

  /// noCourseRegisterYetDes
  ///
  /// In en, this message translates to:
  /// **'Check out the training courses, and start developing your skills'**
  String get noCourseRegisterYetDes;

  /// seeCategory
  ///
  /// In en, this message translates to:
  /// **'Browse courses'**
  String get seeCategory;

  /// noItemsInCart
  ///
  /// In en, this message translates to:
  /// **'You haven\'t added anything yet'**
  String get noItemsInCart;

  /// cartItems
  ///
  /// In en, this message translates to:
  /// **'Cart Items'**
  String get cartItems;

  /// orientalPrice
  ///
  /// In en, this message translates to:
  /// **'Original Price'**
  String get orientalPrice;

  /// completeOrder
  ///
  /// In en, this message translates to:
  /// **'Complete Order'**
  String get completeOrder;

  /// finalPrice
  ///
  /// In en, this message translates to:
  /// **'Final price'**
  String get finalPrice;

  /// free
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// inCart
  ///
  /// In en, this message translates to:
  /// **'In cart'**
  String get inCart;

  /// orderInReview
  ///
  /// In en, this message translates to:
  /// **'Your request is under review'**
  String get orderInReview;

  /// courseContinue
  ///
  /// In en, this message translates to:
  /// **'Complete course'**
  String get courseContinue;

  /// completeCheckOut
  ///
  /// In en, this message translates to:
  /// **'Complete Order'**
  String get completeCheckOut;

  /// offlinePayment
  ///
  /// In en, this message translates to:
  /// **'By contacting us'**
  String get offlinePayment;

  /// cartPayment
  ///
  /// In en, this message translates to:
  /// **'Pay online'**
  String get cartPayment;

  /// offlineOrderDes
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to be able to contact you after completing the order'**
  String get offlineOrderDes;

  /// note
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get note;

  /// addNote
  ///
  /// In en, this message translates to:
  /// **'Enter your notes'**
  String get addNote;

  /// orderDone
  ///
  /// In en, this message translates to:
  /// **'Your request has been registered successfully'**
  String get orderDone;

  /// orderDoneDes
  ///
  /// In en, this message translates to:
  /// **'Our team will contact you and confirm the order within 24 hours, but if you pay by card, you will be able to start attending directly'**
  String get orderDoneDes;

  /// yourOrderInReview
  ///
  /// In en, this message translates to:
  /// **'Your Order In Review'**
  String get yourOrderInReview;

  /// goToPayment
  ///
  /// In en, this message translates to:
  /// **'Go To Payment'**
  String get goToPayment;

  /// notification
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// darkMode
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// lightMode
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// autoDarkMode
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get autoDarkMode;

  /// choseThemeMode
  ///
  /// In en, this message translates to:
  /// **'Chose Theme Mode'**
  String get choseThemeMode;

  /// confirmEmail
  ///
  /// In en, this message translates to:
  /// **'Email confirmation'**
  String get confirmEmail;

  /// confirmEmailDes
  ///
  /// In en, this message translates to:
  /// **'We have sent a verification code to your Email address: '**
  String get confirmEmailDes;

  /// youCanRequestAgainIn
  ///
  /// In en, this message translates to:
  /// **'You can request a code again after  '**
  String get youCanRequestAgainIn;

  /// sendCodeAgain
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get sendCodeAgain;

  /// emailConfirmDone
  ///
  /// In en, this message translates to:
  /// **'Email has been confirmed successfully'**
  String get emailConfirmDone;

  /// show
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get show;

  /// next
  ///
  /// In en, this message translates to:
  /// **'Complete and continue'**
  String get next;

  /// preview
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// completedPercent
  ///
  /// In en, this message translates to:
  /// **'Completion Percentage'**
  String get completedPercent;

  /// completeCourse
  ///
  /// In en, this message translates to:
  /// **'Complete Course'**
  String get completeCourse;

  /// completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// yourSessionHasExpired
  ///
  /// In en, this message translates to:
  /// **'Your session has expired, please log in again'**
  String get yourSessionHasExpired;

  /// noLectureToShow
  ///
  /// In en, this message translates to:
  /// **'there is no lecture to show'**
  String get noLectureToShow;

  /// attachments
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// minute
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get minute;

  /// quizDuration
  ///
  /// In en, this message translates to:
  /// **'Quiz Duration :'**
  String get quizDuration;

  /// totalOfQuestions
  ///
  /// In en, this message translates to:
  /// **'Total of questions :'**
  String get totalOfQuestions;

  /// minimumToPassTheTest
  ///
  /// In en, this message translates to:
  /// **'Minimum to pass the test :'**
  String get minimumToPassTheTest;

  /// quizStartDes
  ///
  /// In en, this message translates to:
  /// **'The test must be completed in one sitting. You cannot save and finish later.'**
  String get quizStartDes;

  /// quizStart
  ///
  /// In en, this message translates to:
  /// **'Start Quiz'**
  String get quizStart;

  /// wantToEndQuiz
  ///
  /// In en, this message translates to:
  /// **'Do you want to finish this test?'**
  String get wantToEndQuiz;

  /// remainingTime
  ///
  /// In en, this message translates to:
  /// **'Remaining time'**
  String get remainingTime;

  /// noAnswerSelected
  ///
  /// In en, this message translates to:
  /// **'No answer selected yet'**
  String get noAnswerSelected;

  /// enterYourAnswer
  ///
  /// In en, this message translates to:
  /// **'Enter Your Answer'**
  String get enterYourAnswer;

  /// quizSubmitted
  ///
  /// In en, this message translates to:
  /// **'Quiz Submitted successfully'**
  String get quizSubmitted;

  /// quizTimeFinish
  ///
  /// In en, this message translates to:
  /// **'Submission time is over'**
  String get quizTimeFinish;

  /// quizHasSubmitted
  ///
  /// In en, this message translates to:
  /// **'Quiz Submitted'**
  String get quizHasSubmitted;

  /// instructor
  ///
  /// In en, this message translates to:
  /// **'instructor'**
  String get instructor;

  /// toManagement
  ///
  /// In en, this message translates to:
  /// **'Management Courses\n'**
  String get toManagement;

  /// decAdminOrHome
  ///
  /// In en, this message translates to:
  /// **'Hello. 👋 you have access as admin choose from options below.\n If you would to go to your workspace or admin dashboard'**
  String get decAdminOrHome;

  /// adminDashBord
  ///
  /// In en, this message translates to:
  /// **'Admin panel '**
  String get adminDashBord;

  /// myWorkSpace
  ///
  /// In en, this message translates to:
  /// **' Work Space'**
  String get myWorkSpace;

  /// generalInformation
  ///
  /// In en, this message translates to:
  /// **'General Information'**
  String get generalInformation;

  /// todayFollowUp
  ///
  /// In en, this message translates to:
  /// **'Today\nFollow Up'**
  String get todayFollowUp;

  /// pandingCalls
  ///
  /// In en, this message translates to:
  /// **'Pending\nCalls'**
  String get pandingCalls;

  /// waitingForYourCall
  ///
  /// In en, this message translates to:
  /// **'Waiting For\nYour Call'**
  String get waitingForYourCall;

  /// numberOfReg
  ///
  /// In en, this message translates to:
  /// **'Number\nof Reg'**
  String get numberOfReg;

  /// phoneStatus
  ///
  /// In en, this message translates to:
  /// **'Phone Status'**
  String get phoneStatus;

  /// answerd
  ///
  /// In en, this message translates to:
  /// **'Answered'**
  String get answerd;

  /// notReached
  ///
  /// In en, this message translates to:
  /// **'Not\nReached'**
  String get notReached;

  /// closed
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// customerStatus
  ///
  /// In en, this message translates to:
  /// **'Customers Status'**
  String get customerStatus;

  /// blanks
  ///
  /// In en, this message translates to:
  /// **'Blanks'**
  String get blanks;

  /// pendingHasFollowUp
  ///
  /// In en, this message translates to:
  /// **'Pending & has\nFollow up'**
  String get pendingHasFollowUp;

  /// interestedHasFollowUp
  ///
  /// In en, this message translates to:
  /// **'Interested\n&follow up'**
  String get interestedHasFollowUp;

  /// wrongNumber
  ///
  /// In en, this message translates to:
  /// **'Wrong Number'**
  String get wrongNumber;

  /// changedHisMind
  ///
  /// In en, this message translates to:
  /// **'Changed\nHis Mind'**
  String get changedHisMind;

  /// finalResults
  ///
  /// In en, this message translates to:
  /// **'Final Results'**
  String get finalResults;

  /// reserved
  ///
  /// In en, this message translates to:
  /// **'Reserved'**
  String get reserved;

  /// interview
  ///
  /// In en, this message translates to:
  /// **'Interview'**
  String get interview;

  /// pendingApproval
  ///
  /// In en, this message translates to:
  /// **'Pending\napproval'**
  String get pendingApproval;

  /// noCallAgain
  ///
  /// In en, this message translates to:
  /// **'Do Not\ncall again'**
  String get noCallAgain;

  /// database
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get database;

  /// goodM
  ///
  /// In en, this message translates to:
  /// **'Good Morning '**
  String get goodM;

  /// goodE
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodE;

  /// homeAdmin
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeAdmin;

  /// agentsAdmin
  ///
  /// In en, this message translates to:
  /// **'Agents'**
  String get agentsAdmin;

  /// agentsReport
  ///
  /// In en, this message translates to:
  /// **'Agents Reports'**
  String get agentsReport;

  /// fillterDsc
  ///
  /// In en, this message translates to:
  /// **'Fill all fields below\n Then click filter data'**
  String get fillterDsc;

  /// filterData
  ///
  /// In en, this message translates to:
  /// **'Filter Data'**
  String get filterData;

  /// startDate
  ///
  /// In en, this message translates to:
  /// **'Start date '**
  String get startDate;

  /// endDate
  ///
  /// In en, this message translates to:
  /// **'End date '**
  String get endDate;

  /// startDateReq
  ///
  /// In en, this message translates to:
  /// **'Start date is required 😐'**
  String get startDateReq;

  /// endDateReq
  ///
  /// In en, this message translates to:
  /// **'End date is required 😐'**
  String get endDateReq;

  /// category
  ///
  /// In en, this message translates to:
  /// **'Category section is required 😐'**
  String get category;

  /// bill
  ///
  /// In en, this message translates to:
  /// **'Billing Report'**
  String get bill;

  /// byRegistered
  ///
  /// In en, this message translates to:
  /// **'By Registered'**
  String get byRegistered;

  /// talNumberReg
  ///
  /// In en, this message translates to:
  /// **'Total\nNumber reg'**
  String get talNumberReg;

  /// totalNumberRegPaid
  ///
  /// In en, this message translates to:
  /// **'Total\nNumber Paid'**
  String get totalNumberRegPaid;

  /// totalNumberRegUnPaid
  ///
  /// In en, this message translates to:
  /// **'Total\nNumber UnPaid'**
  String get totalNumberRegUnPaid;

  /// Total Cancel
  ///
  /// In en, this message translates to:
  /// **'Total\nCancel'**
  String get totalCancel;

  /// totalPending
  ///
  /// In en, this message translates to:
  /// **'Total\nPending'**
  String get totalPending;

  /// totalActive
  ///
  /// In en, this message translates to:
  /// **'Total Active'**
  String get totalActive;

  /// totalStata
  ///
  /// In en, this message translates to:
  /// **'Total Statement '**
  String get totalStata;

  /// totalAm
  ///
  /// In en, this message translates to:
  /// **'Total\nAmount'**
  String get totalAm;

  /// paid
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// remainin
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remainin;

  /// revenue
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// payCollection
  ///
  /// In en, this message translates to:
  /// **'Payment collection'**
  String get payCollection;

  /// netIncome
  ///
  /// In en, this message translates to:
  /// **'Net\nIncome'**
  String get netIncome;

  /// summary
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// nofRegistration
  ///
  /// In en, this message translates to:
  /// **'Number\nOf Registration'**
  String get nofRegistration;

  /// nofCancellation
  ///
  /// In en, this message translates to:
  /// **'Number\nof Cancellation'**
  String get nofCancellation;

  /// theAmountValue
  ///
  /// In en, this message translates to:
  /// **'The\nAmount Value'**
  String get theAmountValue;

  /// theAmountValueCan
  ///
  /// In en, this message translates to:
  /// **'The Amount\nValue (Cancellation)'**
  String get theAmountValueCan;

  /// balOfRemainin
  ///
  /// In en, this message translates to:
  /// **'Balance Of Remaining\n(with filter)'**
  String get balOfRemainin;

  /// nOfCustomer
  ///
  /// In en, this message translates to:
  /// **'N.of Customer'**
  String get nOfCustomer;

  /// balanceValue
  ///
  /// In en, this message translates to:
  /// **'Balance Value'**
  String get balanceValue;

  /// balOfRemaininNoFil
  ///
  /// In en, this message translates to:
  /// **'Balance Of Remaining\n(without filter)'**
  String get balOfRemaininNoFil;

  /// balOfCancelNoFil
  ///
  /// In en, this message translates to:
  /// **'Balance Of Cancellation\n(Total without filter)'**
  String get balOfCancelNoFil;

  /// amountCancel
  ///
  /// In en, this message translates to:
  /// **'Amount\nCancel'**
  String get amountCancel;

  /// amountPending
  ///
  /// In en, this message translates to:
  /// **'Amount\npending'**
  String get amountPending;

  /// paymentsDue
  ///
  /// In en, this message translates to:
  /// **'Total number\nOf payments due'**
  String get paymentsDue;

  /// totalNumber
  ///
  /// In en, this message translates to:
  /// **'Total\nnumber'**
  String get totalNumber;

  /// totatFday
  ///
  /// In en, this message translates to:
  /// **'Total for\nThe day'**
  String get totatFday;

  /// numberOfOrder
  ///
  /// In en, this message translates to:
  /// **'By number\nOf Order'**
  String get numberOfOrder;

  /// totalOrderPaid
  ///
  /// In en, this message translates to:
  /// **'Total number\nOrder Paid'**
  String get totalOrderPaid;

  /// totalNumberOrderRemaining
  ///
  /// In en, this message translates to:
  /// **'Total number\nOrder Remaining'**
  String get totalNumberOrderRemaining;

  /// byAgents
  ///
  /// In en, this message translates to:
  /// **'Billing Report\nBy agent'**
  String get byAgents;

  /// totalPaidA
  ///
  /// In en, this message translates to:
  /// **'Total\nPaid'**
  String get totalPaidA;

  /// totalRemAg
  ///
  /// In en, this message translates to:
  /// **'Total\nRemaining'**
  String get totalRemAg;

  /// commision
  ///
  /// In en, this message translates to:
  /// **'Commision'**
  String get commision;

  /// exCommision
  ///
  /// In en, this message translates to:
  /// **'Expected\nCommission'**
  String get exCommision;

  /// commisionReservation
  ///
  /// In en, this message translates to:
  /// **'Number\nOf reservation'**
  String get commisionReservation;

  /// commisionFull
  ///
  /// In en, this message translates to:
  /// **'Number\nOf full payment'**
  String get commisionFull;

  /// commisionRemaining
  ///
  /// In en, this message translates to:
  /// **'Number\nOf has remaining'**
  String get commisionRemaining;

  /// mCommision
  ///
  /// In en, this message translates to:
  /// **'Monthly Commission'**
  String get mCommision;

  /// commisionThisM
  ///
  /// In en, this message translates to:
  /// **'Commision\nThis month'**
  String get commisionThisM;

  /// effortTitle
  ///
  /// In en, this message translates to:
  /// **'Effort report'**
  String get effortTitle;

  /// dayEffort
  ///
  /// In en, this message translates to:
  /// **'Daily\neffort'**
  String get dayEffort;

  /// monthEffort
  ///
  /// In en, this message translates to:
  /// **'Monthly\neffort'**
  String get monthEffort;

  /// navEffort
  ///
  /// In en, this message translates to:
  /// **'Effort'**
  String get navEffort;

  /// navBilling
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get navBilling;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
