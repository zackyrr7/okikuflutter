import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/auth/controller/auth_controller.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/home/widget/backgroud_header.dart';
import 'package:okiku/modules/home/widget/moodbox.dart';
import 'package:okiku/modules/home/widget/streak.dart';
import 'package:okiku/themes/app_color.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Homecontroller homecontroller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              width: Get.width,
              // height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.1),
                  Row(
                    children: [
                      CircleAvatar(radius: 35),
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'nama',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'One Line a Day',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  RichText(
                    text: TextSpan(
                      text: 'Welcome, ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'nama!',

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Text(
                    "Let your memories be recorded",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Hello, How's your day? ",
                      hintStyle: TextStyle(
                        color: AppColor.textDark.withOpacity(0.5),
                      ),
                      suffixIcon: Icon(Icons.send, color: AppColor.textDark),
                      filled: true,
                      fillColor: AppColor.backgroundCream,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  MoodBox(),
                  SizedBox(height: Get.height * 0.02),
                  Streak()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
