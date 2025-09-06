import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/binding/auth/AuthBinding.dart';
import 'package:okiku/binding/detailUser/DetailUserBinding.dart';
import 'package:okiku/binding/home/HomeBinding.dart';
import 'package:okiku/modules/auth/view/intro_screen.dart';
import 'package:okiku/modules/auth/view/login_screen.dart';
import 'package:okiku/modules/detail/view/create_detail_view.dart';
import 'package:okiku/modules/home/view/home_screen.dart';
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

    //HOME
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
  ];
}
