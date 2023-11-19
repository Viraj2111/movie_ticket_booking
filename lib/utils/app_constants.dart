import 'package:flutter/foundation.dart' as app;
import 'dart:io' show Platform;

class ApiAppConstants {
  // Network Constants
  static String apiEndPoint = "https://api.elpixie.com/"; //dev new

  // static String apiEndPoint = "https://api.elpixie.com/"; //dev
  // static String apiEndPoint = "https://api.elpixie.com/"; //live
  // String productionApi = "https://api.elpixie.com/";
  // static String apiEndPoint =
  // "https://89b3-2405-201-201d-207c-8058-be4b-7019-b050.in.ngrok.io/";
  // static String apiEndPoint = "http://192.168.29.136/"; //rahul
  // static String apiEndPoint = "http://192.168.29.98/"; //foji

  // static String apiEndPoint = "http://192.168.29.174/";//arpit
  static String apiKey = "b402a414b1aa49699e8c35c68bf91c2f";

//admin userid
  static const String adminid =
      app.kDebugMode ? "6317885be0fa1f19ab303d3c" : "6321d6d2b4e4916653673e11";
// app.kDebugMode ? "6317885be0fa1f19ab303d3c" : "6321d6d2b4e4916653673e11";
  // Authentication
  static const String login = 'user/login';
  static const String googlelogin = 'user/google_login';
  static const String facebooklogin = 'user/facebook_login';
  static const String applelogin = 'user/apple_login';
  static const String otpVerification = 'user/otp_verification';
  static const String emailOtpVerification = 'photographer/otp_verification';
  static const String updateProfile = 'user/profile/update';
  static const String deleteAccountUSER = 'user/account/delete';
  static const String deleteAccountPHOTOGRAPHER = 'photographer/account/delete';
  static const String addfeedback = 'user/feedback/add';
  static const String getfeedback = 'user/feedback';
  static const String photographerProfile = 'photographer/profile';
  static const String userProfile = 'user/profile';
  static const String getbooking = 'user/booking';
  static const String orderDetails = 'user/booking';
  static const String cancelorder = 'user//booking/cancel';

  static const String notification = 'user/notification';
  static const String imageupload = 'user/profile';
  static const String getPhotographer = 'user/get_photographer';
  static const String bookingadd = 'user/booking/add';
  static const String getNotificationSetting = 'user/notification/setting';
  static const String updateNotificationSetting = 'user/notification/update';
  static const String paypalPayment = 'user/paypal/pay?';

  static const String cancelPayment = 'user/cancel_payment';
  static const String wallet = 'photographer/profile';

  static const String withdraw = 'photographer/withdraw';
  static const String userjobdataget = 'photographer/withdraw';
  static const String report = 'user/report/add';

  // image
  static const String images = 'images';
  static const String uploadImage = 'upload/profile';
  static const String photographer = 'photographer/want_photographer';
  static const String addphotographer = 'photographer/add_photographer';
  static const String skill = 'admin/skill';
  static const String logout = 'user/logout';
  static const String category = 'admin/category';
  static const String getUserMessage = 'user/message';
  static const String userRooms = 'user/room';
  static const String photographerUpdate = 'photographer/profile/update';
  static const String photoUploads = 'photographer/update_booking';

  //Photographer
  static const String photographerBookingHistory =
      'photographer/booking/get_booking_history';
  static const String completeBooking = "user/booking/complete_booking";
  static const String updateBookingStatus =
      'photographer/booking/updateBookingStatus';
  static const String getTransaction = 'photographer/withdraw/get';

  //User
  static const String userBookingHistory = 'user/booking/active_complete';
  static const String photographerCategory = 'photographer/category';
  static const String photographerSkills = 'photographer/skill';

  static const String addRoom = 'user/room/add';
  static const String addEmail = 'user/add_email';

  //Job
  static const String getUserJob = 'user/job/get';
  static const String createUserJob = 'user/job';
  static const String getJobDetailbyId = 'user/job/applicant/get';
  static const String getPhotographerJob = 'photographer/job/get';
  static const String getPhotographerAppliedJob = 'photographer/job/apply/get';
  static const String applyforJob = 'photographer/job/apply';
  static const String deleteJob = 'user/job/';
  static const String acceptJob = 'user/job/accept';
  static const String event = 'user/event/getAll';
  static const String responseEvent = 'user/event/participate';

  //download
  static const String download = 'user/booking/download/';

  //community
  static const String getallquestions = 'user/get/allQuestions';
  static const String getallNews =
      'https://newsapi.org/v2/top-headlines?category=business&apiKey=';
  static const String getanswers = 'user/get/answer/';
  static const String addanswer = 'user/add/answer';
  static const String addquestions = 'user/add/question';

  ///market
  static const String allmarketproduct = 'user/products';
  static const String filtermarketproduct = 'user/marketplace/search';
  static const String marketitemdetail = 'user/product/';
  static const String addforrent = 'photographer/product/add';
  static const String updaterentitem = 'photographer/product/update';
  static const String rentitem = 'user/marketplace/paypal/pay?';
  static const String myItemrentorder = 'photographer/marketplace/orders';
  static const String myrenteditemorder = 'user/marketplace/orders';
  static const String deleteitem = 'photographer/product/';
  static const String photographerrentllist = 'photographer/product/get';

  ///favorite
  static const String addRemoveFavorite = 'user/favorite_photographer/';
  static const String getFavorite = 'user/get/favorite_photographer';

  ///orderbetween
  static const String orderBetweentwo = 'user/booking/userAndPhotographer/';
  static const String getAlert = 'user/get/alert';

  ///ads
  static const String getAds = 'admin/get/advertisement';

  ///
  /// boost profile
  static const String boostProfile = 'user/paypal/profile_booster/pay';
  static const String getBoosterdata = 'photographer/profile_booster';
}
