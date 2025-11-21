import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/themes/app_color.dart';

class MoodBox extends StatelessWidget {
  MoodBox({super.key});
  final Homecontroller homecontroller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
   
    return Container(
      height: Get.height * 0.2,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.backgroundCream,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.textDark,
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              "Your Mood Today",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Let’s make a journal today, so Kiku can purr out all his feelings!',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 8),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        homecontroller.mood.value == 'happy'
                            ? 'assets/logo/Happy-active.png'
                            : 'assets/logo/Happy.png',
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Happy',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                      homecontroller.mood.value == 'sad'
                            ? 'assets/logo/Sad-active.png'
                            : 'assets/logo/Sad.png',
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Sad',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                       homecontroller.mood.value == 'netral'
                            ? 'assets/logo/Netral-acctive.png'
                            : 'assets/logo/Netral.png',
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Netral',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        homecontroller.mood.value == 'anxious'
                            ? 'assets/logo/Anxious-active.png'
                            : 'assets/logo/Anxious.png',
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Anxious',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                         homecontroller.mood.value == 'angry'
                            ? 'assets/logo/Angry-active.png'
                            : 'assets/logo/Angy.png',
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Angry',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
