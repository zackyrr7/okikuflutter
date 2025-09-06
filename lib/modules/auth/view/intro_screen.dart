import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/themes/app_color.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height * 0.55,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 203,
                    width: 203,
                    child: Image.asset(
                      'assets/logo/create.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'OKIKU',
                    style: TextStyle(
                      letterSpacing: 10,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Container(
              height: Get.height * 0.4,
              width: Get.width,

              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      "Meong!\nHalo, Aku Kiku \n"
                      "Aku sudah tidak sabar untuk nemenin kamu\n"
                      "Ayo, tekan tombol di bawah biar kita mulai!",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.offNamed('/login');
                        },
                        child: Container(
                          height: Get.height * 0.06,
                          width: Get.width * 0.95,
                        
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.textDark,
                          ),
                          child: Center(
                            child: Text(
                              'Lanjutkan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
