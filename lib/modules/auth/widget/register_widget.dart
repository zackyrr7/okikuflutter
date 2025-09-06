import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/auth/controller/auth_controller.dart';
import 'package:okiku/themes/app_color.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                controller: authController.nameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.person, color: Colors.amber),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                controller: authController.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.mail, color: Colors.amber),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 10),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextFormField(
                  controller: authController.passwordController,
                  obscureText: authController.secureText.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        authController.isSecureText();
                      },
                      icon: Icon(
                        authController.secureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.lock, color: Colors.amber),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent),
                    ),
                  ),
                ),
              );
            }),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextFormField(
                  controller: authController.passwordVerifController,
                  obscureText: authController.secureText2.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        authController.isSecureText2();
                      },
                      icon: Icon(
                        authController.secureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

                    labelText: 'Conffirm Password',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.lock, color: Colors.amber),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent),
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                authController.register();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryYellow,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: Get.width * 0.9,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            Row(
              children: [
                SizedBox(width: 16),
                Expanded(child: Divider(thickness: 1, color: Colors.black)),
                SizedBox(width: Get.width * 0.05),
                Text('Or register with'),
                SizedBox(width: Get.width * 0.05),

                Expanded(child: Divider(thickness: 1, color: Colors.black)),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                authController.loginGoogle();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: Get.width * 0.9,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Google",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
