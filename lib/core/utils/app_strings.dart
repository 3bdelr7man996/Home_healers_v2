class AppStrings {
  static String baseUrl = "https://dev.home-healers.com";
  static String imageUrl = "https://dev.home-healers.com/upload/";
  static String divSecondUrl = "https://testing.home-healers.com";

  //api url
  static String advertiseSignUp = "/api/registerAdv";
  static String userSignIn = "/api/user/login";
  static String advDepartments = "/api/categories";
  static String advStatus = "/api/status";
  static String advAllCities = "/api/Cities_Areas";
  static String resOrdersStatus = "/api/reservaionGetStatus";
  static String allReservations = "/api/advertiser/reservations";
  static String statusReservations = "/api/reservaionGet";
  static String advUpdateReservation = "/api/advertiser/updateReservation";
  static String addDiagnoseReport = "/api/advertiser/addDiagnose";
  static String diagnoseSections = "/api/diagnose_form";
  static String addFileReport = "/api/advertiser/addReport";
  static String updateProfile = "/api/advertiser/update";
  static String advCertification = "/api/advertiser/cirtificate";
  static String appInfo = "/api/app_info";
  static String allNotifications = "/api/getAllNotifications";
  static String doctorsPoints = "/api/advertiser/getDoctorPoints";
  static String sendMessage = "/api/chat/send";
  static String allMessages = "/api/chat/retrieve";
  static String allConversations = "/api/chatStatus";
  static String activeStatus = "/api/advertiser/updateStatus";
  static String reservationDetails = "/api/reservaionGetByID";

  //api url for patient
  static String patientSignUp = "/api/user/register";
  static String patientSignIn = "/api/user/login";
  static String visaPayment = "/api/payment";
  static String tamaraPayment = "/api/tamara-payment";
  static String pUpdateReservation = "/api/user/updateReservation";
  static String payByWallet = "/api/user/pay-by-wallet";

  //assets url
  static String appName = "Home Healers";
  static String localizationPath = "assets/translations";
  static String assetsImagesPath = "assets/images/";
  static String assetsIconsPath = "assets/icons/";

  //SHARED PREFERENCE
  static String userToken = "USER_TOKEN";
  static String userId = "USER_ID";
  static String userEmail = "USER_EMAIL";
  static String userFullName = "USER_NAME";
  static String userMobile = "USER_MOBILE";
  static String userInfo = "USER_INFO";
  static String isAdvertise = "IS_ADVERTISE";
  static String isActive = "USER_ACTIVE";

  //APP CONFIGIRATION
  static String PUSHER_APP_ID = '1714511';
  static String PUSHER_APP_KEY = '7256046f50a9f3e2a17a';
  static String PUSHER_APP_SECRET = '21720d29ec15b4099ca2';
  static String PUSHER_APP_CLUSTER = 'eu';

  static String mapApiKey = "AIzaSyBL3got10NTJkmjKT9fgaDPraXxqgb33EQ";
  //Demo
  static String placeHolderNetwImg =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8_JD8O8pUYNuD9LQLbg4-lq8OQ9EIdMEc_w&usqp=CAU";
}
