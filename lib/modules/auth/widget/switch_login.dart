import 'package:flutter/material.dart';
import 'package:okiku/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SwitchLogin extends StatelessWidget {
  SwitchLogin({super.key});
  final AuthController authController =  Get.put<AuthController>(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Column(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black12,
                ),
              ),
              AnimatedAlign(
                alignment:
                    authController.isLoginIsSelected.value
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                duration: Duration(milliseconds: 200),
                child: Container(
                  width: Get.width * 0.49,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: authController.selectLogin,
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color:
                                    authController.isLoginIsSelected.value
                                        ? Colors.white
                                        : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: authController.selectRegister,
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color:
                                authController.isLoginIsSelected.value
                                    ? Colors.grey
                                    : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    });
     
  }
}
