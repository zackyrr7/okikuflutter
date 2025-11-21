import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/constant.dart';
import 'package:okiku/modules/auth/controller/auth_controller.dart';
import 'package:okiku/modules/chat/controller/chat_controller.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/home/widget/backgroud_header.dart';
import 'package:okiku/modules/home/widget/history.dart';
import 'package:okiku/modules/home/widget/moodbox.dart';
import 'package:okiku/modules/home/widget/streak.dart';
import 'package:okiku/themes/app_color.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Homecontroller homecontroller = Get.find<Homecontroller>();
  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
                // height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    Row(
                      children: [
                        Obx(
                          () => CircleAvatar(
                            backgroundColor: AppColor.primaryYellow,
                            radius: 35,
                            backgroundImage:
                                homecontroller.foto.value.isNotEmpty
                                    ? NetworkImage(
                                      "$urlImage${homecontroller.foto.value}",
                                    )
                                    : null,
                            child:
                                homecontroller.foto.value.isEmpty
                                    ? Icon(Icons.person, size: 35)
                                    : null,
                          ),
                        ),

                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                homecontroller.nama.value,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Text(
                            //   'One Line a Day',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.normal,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Obx(
                      () => RichText(
                        text: TextSpan(
                          text: 'Welcome, ',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          children: [
                            TextSpan(
                              text: '${homecontroller.nama.value}!',

                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
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
                      controller: chatController.lineController,
                      decoration: InputDecoration(
                        hintText: "Hello, How's your day? ",
                        hintStyle: TextStyle(
                          color: AppColor.textDark.withOpacity(0.5),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (chatController.lineController.value.text !=
                                '') {
                              Get.toNamed('/chat');
                              chatController.chatLine();
                            } else {
                              Get.toNamed('/chat');
                            }
                          },
                          icon: Icon(Icons.send),
                          color: AppColor.textDark,
                        ),
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
                    SizedBox(height: Get.height * 0.025),
                    MoodBox(),
                    SizedBox(height: Get.height * 0.025),
                    Streak(),
                    SizedBox(height: Get.height * 0.025),
                    History(),
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
