import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/helper/helper.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/profile/widget/header_profile.dart';
import 'package:okiku/modules/profile/widget/popup_akun.dart';
import 'package:okiku/modules/profile/widget/popup_keluar.dart';
import 'package:okiku/themes/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final Homecontroller homecontroller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCream,

        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profil',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HeaderProfile(),
            SizedBox(height: Get.height * 0.01),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaryYellow.withValues(alpha: 0.5),
              ),

              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.dialog(PopupAkun());
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(width: Get.width * 0.02),
                                Text('Akun'),
                              ],
                            ),
                            Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(color: AppColor.primaryYellow),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/detail-create');
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.palette),
                                SizedBox(width: Get.width * 0.02),
                                Text('Personalisasi data'),
                              ],
                            ),
                            Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16, right: 16),
                  //   child: Divider(color: AppColor.primaryYellow),
                  // ),
                  // GestureDetector(
                  //   child: Container(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(16.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               Icon(Icons.help),
                  //               SizedBox(width: Get.width * 0.02),
                  //               Text('Support'),
                  //             ],
                  //           ),
                  //           Icon(Icons.arrow_right),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(color: AppColor.primaryYellow),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url = Uri.parse('http://okiku.web.id/privacy');

                      final can = await canLaunchUrl(url);
                      print("Can launch? $can"); // debug

                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    },

                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.security),
                                SizedBox(width: Get.width * 0.02),
                                Text('Privacy Policy'),
                              ],
                            ),
                            Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            GestureDetector(
              onTap: () {
                // Get.offAndToNamed('/login');
                // Helper().deleteToken();
                Get.dialog(PopUpKeluar());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.accentBurntOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(width: Get.width * 0.02),
                          Text('Keluar'),
                        ],
                      ),
                    ],
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
