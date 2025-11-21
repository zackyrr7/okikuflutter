import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/helper/helper.dart';
import 'package:okiku/themes/app_color.dart';

class PopupEditDetail extends StatelessWidget {
  const PopupEditDetail({super.key});

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
              SizedBox(
                height: Get.width * 0.35,
                child: Image.asset(
                  'assets/logo/nguap.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 12),
              const Text(
                "~Meong~",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              const SizedBox(height: 8),
              const Text(
                "Datamu belum lengkap \nisi datamu terlebih dahulu",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Get.toNamed('/detail-create');
                },
                child: Container(
                  width: Get.width * 0.3,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primaryYellow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: const Text(
                      "iya",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
