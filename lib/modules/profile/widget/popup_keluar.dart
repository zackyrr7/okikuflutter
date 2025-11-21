import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/helper/helper.dart';
import 'package:okiku/themes/app_color.dart';

class PopUpKeluar extends StatelessWidget {
  const PopUpKeluar({super.key});

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

              const SizedBox(height: 12),
              const Text(
                "~Meong~",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              const SizedBox(height: 8),
              const Text(
                "Yakin mau keluar?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(), // tidak keluar
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Tidak"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAndToNamed('/login');
                      Helper().deleteToken();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Ya",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
