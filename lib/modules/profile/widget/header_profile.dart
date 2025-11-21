import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/constant.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/profile/controller/profile_controller.dart';
import 'package:okiku/themes/app_color.dart';

class HeaderProfile extends StatelessWidget {
  HeaderProfile({super.key});

  final Homecontroller homecontroller = Get.find<Homecontroller>();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.accentOlive,
        borderRadius: BorderRadius.circular(12),
      ),
      height: Get.height * 0.3,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              height: Get.height * 0.3,
              width: Get.width * 0.6,
              child: Opacity(
                opacity: 0.2,
                child: Transform.rotate(
                  angle: 8.7,
                  child: Image.asset('assets/logo/sinis.png'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -85,
            right: -85,
            child: Container(
              height: Get.height * 0.3,
              width: Get.width * 0.6,
              child: Opacity(
                opacity: 0.2,
                child: Transform.rotate(
                  angle: 5.5,
                  child: Image.asset('assets/logo/nguap.png'),
                ),
              ),
            ),
          ),

          Align(
            alignment: AlignmentGeometry.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: Get.width * 0.4,
                  width: Get.width * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.amberAccent,
                  ),
                  child: Obx(
                    () => ClipOval(
                      child:
                          homecontroller.foto.value.isNotEmpty
                              ? Image.network(
                                '$urlImage${homecontroller.foto.value}',
                                fit: BoxFit.cover,
                              )
                              : Image.asset('assets/icons/paw.png'),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Obx(
                  () => Text(
                    homecontroller.nama.value,
                    style: TextStyle(
                      color: AppColor.backgroundCream,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Edit profil ',
                //       style: TextStyle(
                //         color: AppColor.primaryYellow,

                //         fontSize: 16,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Positioned(
            left: Get.width * 0.6,
            bottom: Get.height * 0.1,
            child: GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: 'Pilih foto',
                  content: Text('Ambil dari mana?'),
                  cancel: ElevatedButton(
                    onPressed: () {
                      profileController.source.value = 'camera';
                      profileController.takePhoto();
                    },
                    child: Text('Camera'),
                  ),
                  onCancel: () {
                    profileController.source.value = 'camera';
                    profileController.takePhoto();
                    Get.back();
                  },
                  confirm: ElevatedButton(
                    onPressed: () {
                      profileController.source.value = 'galeri';
                      profileController.takePhoto();
                      Get.back();
                    },
                    child: Text('Galeri'),
                  ),
                  onConfirm: () {
                    profileController.source.value = 'galeri';
                    profileController.takePhoto();
                  },
                );
              },
              child: Container(
                child: Icon(Icons.edit, color: Colors.white),
                height: Get.width * 0.1,
                width: Get.width * 0.1,
                decoration: BoxDecoration(
                  color: AppColor.accentBurntOrange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
