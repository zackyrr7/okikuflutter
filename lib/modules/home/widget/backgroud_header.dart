import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/themes/app_color.dart';


class BackgroundHeader extends StatelessWidget {
  const BackgroundHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topCenter,
      child: Stack(
        children: [
          Container(
            height: Get.height * 0.45,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.primaryYellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: -85,
            right: -100,
            child: Opacity(
              opacity: 0.2,
              child: Transform.rotate(
                angle: 4,
                child: Container(
                  height: Get.height * 0.35,
                  width: Get.width * 0.7,
                  child: Image.asset(
                    'assets/logo/nguap.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: -100,
           
            child: Opacity(
              opacity: 0.2,
              child: Transform.rotate(
                angle: 1.2,
                child: Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.5,
                  child: Image.asset(
                    'assets/logo/sinis.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
