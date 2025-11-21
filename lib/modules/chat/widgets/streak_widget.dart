import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:okiku/themes/app_color.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({super.key, required this.streakKalimat});

  final RxString streakKalimat;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Get.width * 0.8,
        width: Get.width * 0.8,
        decoration: BoxDecoration(
          color: AppColor.backgroundCream,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.cancel),
              ),
            ),
            Container(
              height: Get.width * 0.4,
              child: Lottie.asset('assets/lottie/streak.json'),
            ),
            Material(
              color: Colors.transparent,
              child: Text(
                "~Meong~",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(height: 8),
            Material(
              color: Colors.transparent,
              child: Text(
                "Selamat hooman, $streakKalimat",
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
