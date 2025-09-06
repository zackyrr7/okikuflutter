import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/auth/controller/auth_controller.dart';
import 'package:okiku/modules/auth/widget/login_widget.dart';
import 'package:okiku/modules/auth/widget/register_widget.dart';
import 'package:okiku/modules/auth/widget/switch_login.dart';
import 'package:okiku/themes/app_color.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                // SizedBox(height: Get.height * 0.08),
                SizedBox(
                  height: Get.height * 0.38,
                  width: Get.height * 0.38,
                  child: Image(
                    image: AssetImage('assets/logo/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: Get.height * 0.7,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColor.backgroundCream,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SwitchLogin(),
                  SizedBox(height: 20),
                  Obx(() {
                    authController.nameController.clear();
                    authController.emailController.clear();
                    authController.passwordController.clear();
                    authController.passwordVerifController.clear();
                    authController.secureText.value = true;
                    authController.secureText2.value = true;
                    return authController.isLoginIsSelected.value
                        ? LoginWidget()
                        : RegisterWidget();
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
