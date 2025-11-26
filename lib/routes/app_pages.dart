import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/binding/auth/AuthBinding.dart';
import 'package:okiku/binding/chat/ChatBinding.dart';
import 'package:okiku/binding/detailUser/DetailUserBinding.dart';
import 'package:okiku/binding/history/HistoryBinding.dart';
import 'package:okiku/binding/home/HomeBinding.dart';
import 'package:okiku/modules/auth/view/intro_screen.dart';
import 'package:okiku/modules/auth/view/login_screen.dart';
import 'package:okiku/modules/chat/screen/chat_screen.dart';
import 'package:okiku/modules/detail/view/create_detail_awal_view.dart';
import 'package:okiku/modules/detail/view/create_detail_view.dart';
import 'package:okiku/modules/history/screen/history_screen.dart';
import 'package:okiku/modules/home/view/home_screen.dart';
import 'package:okiku/modules/profile/view/profile_screen.dart';
import 'package:okiku/navbar.dart';
part 'app_routes.dart';

class AppPages {
  static final route = [
    GetPage(
      name: Routes.NAVBAR,
      page: () => MyNavbar(),
      binding: Homebinding(),
    ),

    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    // GetPage(name: Routes.HOME, page: () => HomeScreen()),

    //create detail
    GetPage(
      name: Routes.CREATEDETAIL,
      page: () => CreateDetailView(),
      binding: Detailuserbinding(),
    ),
    GetPage(
      name: Routes.CREATEDETAILAWAL,
      page: () => CreateDetailViewAwal(),
      binding: Detailuserbinding(),
    ),

    //HOME
    GetPage(name: Routes.HOME, page: () => HomeScreen()),

    GetPage(
      name: Routes.CHAT,
      page: () => ChatScreen(),
      binding: Chatbinding(),
    ),
    GetPage(
      name: Routes.HISTORY,
      page: () => HistoryScreen(),
      binding: Historybinding(),
    ),

    GetPage(name: Routes.PROFIL, page: () => ProfileScreen()),
  ];
}
