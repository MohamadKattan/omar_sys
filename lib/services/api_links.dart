import '../app_info.dart';

const String siteURL = $appLink;
const String siteApiURL = "${siteURL}api/";

// --------  Login and register and Update Profile Links  -------- //

const String loginURL = "${siteApiURL}auth/login";
const String setFcm = "${siteApiURL}auth/setfcm_id";
const String registerURL = "${siteApiURL}auth/register";
const String logoutURL = "${siteApiURL}auth/logout";
const String userinfoURL = "${siteApiURL}auth/user-profile";
const String forgotPasswordURL = "${siteApiURL}auth/forgot-password";
const String changePasswordURL = "${siteApiURL}auth/change_password";
const String updateProfileURL = "${siteApiURL}auth/update";
const String validateEmailURL = "${siteApiURL}auth/validateEmail";
const String sendCodeEmailURL = "${siteApiURL}auth/sendCodeEmail";
const String adminReportUrl = "${siteApiURL}call-record/report";
const String adminAttimndUrl = "${siteApiURL}call-record/attendreport";
const String adminCommisionurl = "${siteApiURL}call-record/commision";
const String adminEffortUrl = "${siteApiURL}call-record/effort";

// --------  User Link  -------- //

const String userPurchasesUrl = "${siteApiURL}dashboard/purchases";
const String userEnrolledCoursesUrl = "${siteApiURL}dashboard/enrolled-courses";
const String userSettingsUrl = "${siteApiURL}dashboard/settings";
const String userWishlistUrl = "${siteApiURL}dashboard/wishlist";

// --------  Home Links  -------- //

const String homeURL = "${siteApiURL}call-record/dashboard";
const String sectionsURL = "${siteApiURL}call-record/sections";
const String sectionsShowURL =
    "${siteApiURL}call-record/index?cat_call_record_id=";
const String attendsURL = "${siteApiURL}call-record/attends";
const String ordersURL = "${siteApiURL}call-record/orders";

// --------  Media Links  -------- //

const String getMedia = "${siteApiURL}getMedia/";

// --------  Courses and Topics Links  -------- //

const String categoriesURL = "${siteApiURL}topics";
const String searchURL = "${siteApiURL}courses?lang=ar&q=";
const String courseURL = "${siteApiURL}courses";

// --------  Lecture Links  -------- //

const String lectureViewURL = "${siteApiURL}courses";
const String contentCompleteURL = "${siteApiURL}content_complete";
const String coursesCompleteURL = "${siteApiURL}courses-complete";

const String saveReviewURL = "${siteApiURL}save-review";

const String discussionAskQuestionURL = "${siteApiURL}discussion/ask-question";
const String discussionReplyURL = "${siteApiURL}discussion/reply";

const String attachmentDownloadURL = "${siteApiURL}attachment-download/";

const String quizStartURL = "${siteApiURL}quiz-start";
const String quizURL = "${siteApiURL}quiz";

// --------  Shopping Cart Link  -------- //

const String cartContentURL = "${siteApiURL}get-cart";
const String deleteCartContentURL = "${siteApiURL}remove-cart";
const String addToCartURL = "${siteApiURL}add-to-cart";

// --------  Payment Link  -------- //

const String offlinePaymentUrl = "${siteApiURL}offline";
const String paddlePaymentUrl = "${siteApiURL}GeneratePaddle";

// --------  Default Image Link  -------- //

const String defaultImageUrl = "${siteURL}uploads/placeholder-image.png";
