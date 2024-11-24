import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/presentation/pages/auth/update_password.dart';
import 'package:medics/presentation/pages/home/detail_event.dart';
import 'package:medics/presentation/pages/home/detail_news.dart';
import 'package:medics/presentation/pages/home/main.dart';
import 'package:medics/presentation/pages/profile/profile.dart';
import 'package:medics/presentation/pages/questioner/questioner1/questioner_first.dart';
// import 'package:medics/routes/test.dart';
import '../bindings/alarm_binding.dart';
import '../bindings/complete_biodata.dart';
import '../bindings/general_bindings.dart';
import '../bindings/questioner_bindings.dart';
import '../presentation/pages/alarm/alarm_notif.dart';
import '../presentation/pages/profile/preview_image.dart';
import '../presentation/pages/alarm/alarm_screen.dart';
import '../presentation/pages/auth/signup.dart';
import '../presentation/pages/auth/forgot_password.dart';
import '../presentation/pages/auth/login.dart';
import '../presentation/pages/auth/update_profile.dart';
import '../presentation/pages/biodata/biodata.dart';
import '../presentation/pages/home/detail_flyer.dart';
import '../presentation/pages/home/event_show_all.dart';
import '../presentation/pages/home/news_show_all.dart';
import '../presentation/pages/onboarding/onboarding.dart';
import '../presentation/pages/profile/complete_biodata.dart';
import '../presentation/pages/questioner/questioner30/questioner_30.dart';

class AppRoutes {
  static final pages = [
    GetPage(
        name: AppLinks.ONBOARDING,
        page: () {
          return OnBoardingScreen();
          // return Test();
        }),
    GetPage(
        name: AppLinks.LOGIN,
        page: () => const LoginScreen(),
        binding: GeneralBindings()),
    GetPage(name: AppLinks.SIGNUP, page: () => const SingUpScreen()),
    GetPage(
        name: AppLinks.FORGOTPASSWORD,
        page: () => const ForgotPasswordScreen()),
    GetPage(name: AppLinks.VERIFYEMAILSCREEN, page: () => SizedBox()),
    GetPage(name: AppLinks.HOMESCREEN, page: () => const MainScreen()),
    GetPage(name: AppLinks.PROFILE, page: () => ProfileScreen()),
    GetPage(
        name: AppLinks.UPDATEPROFILE, page: () => const UpdateProfileScreen()),
    GetPage(
        name: AppLinks.UPDATEPASSWORD,
        page: () => const UpdatePasswordScreen()),
    GetPage(name: AppLinks.ALARM, page: () => const AlarmScreen()),
    GetPage(name: AppLinks.DETAILFLYER, page: () => DetailFlyer()),
    GetPage(name: AppLinks.DETAILEVENT, page: () => EventDetailPage()),
    GetPage(name: AppLinks.DETAILNEWS, page: () => NewsDetailPage()),
    GetPage(name: AppLinks.CHOOSEFASE, page: () => ChooseFaseScreen()),
    GetPage(
        name: AppLinks.COMPLETEBIODATA,
        page: () => CompleteBiodataUpdate(),
        binding: CompleteBiodataBindings()),
    GetPage(name: AppLinks.ALLNEWS, page: () => NewsShowAllScreen()),
    GetPage(name: AppLinks.ALLEVENT, page: () => EventShowAllScreen()),
    GetPage(
        name: AppLinks.QUESTIONERFIRST,
        page: () => QuestionerFirst(),
        binding: QuestionerBindings()),
    GetPage(
        name: AppLinks.QUESTIONER30,
        page: () => Questioner30(),
        binding: QuestionerBindings()),
    GetPage(
      name: AppLinks.IMAGEPREVIEW,
      page: () => ImagePreview(),
    ),
    GetPage(
      name: AppLinks.ALARMSCREEN,
      page: () => AlarmNotif(),
      binding: AlarmBinding(),
    ),
  ];
}

class AppLinks {
  static const String ONBOARDING = "/onboarding";
  static const String LOGIN = "/login";
  static const String SIGNUP = "/signup";
  static const String FORGOTPASSWORD = "/forgotPassword";
  static const String VERIFYEMAILSCREEN = "/verifyEmail";
  static const String HOMESCREEN = "/homeScreen";
  static const String PROFILE = "/profile";
  static const String UPDATEPROFILE = "/updateProfile";
  static const String UPDATEPASSWORD = "/updatePassword";
  static const String ALARM = "/alarm";
  static const String DETAILFLYER = "/detailFlyer";
  static const String DETAILEVENT = "/detailEvent";
  static const String DETAILNEWS = "/detailNews";
  static const String CHOOSEFASE = "/chooseFase";
  static const String COMPLETEBIODATA = "/completeBiodata";
  static const String ALLNEWS = "/allNews";
  static const String ALLEVENT = "/allEvent";
  static const String QUESTIONERFIRST = "/questionerFirst";
  static const String QUESTIONER30 = "/questioner30";

  static const String IMAGEPREVIEW = "/imagePreview";
  static const String ALARMSCREEN = "/alarmScreen";
}
