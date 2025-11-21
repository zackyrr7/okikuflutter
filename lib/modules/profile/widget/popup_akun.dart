import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/helper/helper.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/profile/controller/profile_controller.dart';
import 'package:okiku/themes/app_color.dart';

class PopupAkun extends StatelessWidget {
  PopupAkun({super.key});
  final Homecontroller homecontroller = Get.find<Homecontroller>();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: Get.width * 0.8,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.backgroundCream,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.cancel),
                ),
              ),

              SizedBox(
                height: Get.width * 0.35,
                child: Image.asset(
                  'assets/logo/nguap.png',
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: AppColor.primaryYellow, size: 30),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama',
                        style: TextStyle(
                          color: AppColor.textDark.withValues(alpha: 0.5),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        homecontroller.nama.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: AppColor.primaryYellow, size: 30),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'email',
                        style: TextStyle(
                          color: AppColor.textDark.withValues(alpha: 0.5),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        profileController.email.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
