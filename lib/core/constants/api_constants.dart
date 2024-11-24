class ContantAPI {
  static String baseUrlAPI = "https://tbalert.id";

  static String loginEmail = "https://tbalert.id/api/v1/login/email";
  static String loginGoogle = "https://tbalert.id/api/v1/login/google";
  static String signup = "https://tbalert.id/api/v1/register";
  static String forgotPassword = "https://tbalert.id/api/v1/forgot-password";
  static String logout = "https://tbalert.id/api/v1/logout";

  static String getProfile = "https://tbalert.id/api/v1/user/profile";
  static String updateProfile = "https://tbalert.id/api/v1/user/profile";
  static String updateImageProfile =
      "https://tbalert.id/api/v1/user/profile/edit-photo";
  static String updatePassword =
      "https://tbalert.id/api/v1/user/profile/edit-password";

  static String getFlyer = "https://tbalert.id/api/v1/content/flayers";
  static String getEvents = "https://tbalert.id/api/v1/content/events";
  static String getNews = "https://tbalert.id/api/v1/content/news";

  static String getOnboarding = "https://tbalert.id/api/v1/intros";

  static String biodata = "https://tbalert.id/api/v1/user/biodata";

  static String sendMedicine = "https://tbalert.id/api/v1/send-take-medicine";

  static String cekQuestionerStatus =
      "https://tbalert.id/api/v1/questionnaire/status";
  static String getQuestionerFirst =
      "https://tbalert.id/api/v1/questionnaire?category=1";
  static String getQuestioner30Day =
      "https://tbalert.id/api/v1/questionnaire?category=2";
  static String storeQuestioner = "https://tbalert.id/api/v1/questionnaire";
}
