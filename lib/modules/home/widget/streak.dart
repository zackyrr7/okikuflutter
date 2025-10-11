import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/themes/app_color.dart';

class Streak extends StatelessWidget {
  Streak({super.key});
  final Homecontroller homecontroller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    "Daily Streak",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            (homecontroller
                                            .streakData
                                            .value
                                            ?.result[0]
                                            .streak ??
                                        0) !=
                                    0
                                ? 'assets/icons/fire-active.png'
                                : 'assets/icons/fire.png',
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Mon',
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
                            (homecontroller
                                            .streakData
                                            .value
                                            ?.result[1]
                                            .streak ??
                                        0) !=
                                    0
                                ? 'assets/icons/fire-active.png'
                                : 'assets/icons/fire.png',
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tue',
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
                            (homecontroller
                                            .streakData
                                            .value
                                            ?.result[2]
                                            .streak ??
                                        0) !=
                                    0
                                ? 'assets/icons/fire-active.png'
                                : 'assets/icons/fire.png',
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Wed',
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
                            (homecontroller
                                            .streakData
                                            .value
                                            ?.result[3]
                                            .streak ??
                                        0) !=
                                    0
                                ? 'assets/icons/fire-active.png'
                                : 'assets/icons/fire.png',
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Thu',
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
                            (homecontroller
                                            .streakData
                                            .value
                                            ?.result[4]
                                            .streak ??
                                        0) !=
                                    0
                                ? 'assets/icons/fire-active.png'
                                : 'assets/icons/fire.png',
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Fri',
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
                            (homecontroller
                                            .streakData
                                            .value
                                            ?.result[5]
                                            .streak ??
                                        0) !=
                                    0
                                ? 'assets/icons/fire-active.png'
                                : 'assets/icons/fire.png',
                            height: 40,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(height: 4),
                          Text(
                            'Sat',
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
                            (homecontroller
                                            .streakData
                                            .value
                                            ?.result[6]
                                            .streak ??
                                        0) !=
                                    0
                                ? 'assets/icons/fire-active.png'
                                : 'assets/icons/fire.png',
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Sun',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.0733,
              decoration: BoxDecoration(
                color: AppColor.accentOlive,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'Current Streak: ',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.backgroundCream,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Obx(() =>
                    
                    
                    Text(
                      '${homecontroller.streakData.value?.streaks ?? 0} days',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.backgroundCream,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
