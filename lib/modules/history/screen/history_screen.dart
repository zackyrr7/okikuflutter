import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/chat/controller/chat_controller.dart';
import 'package:okiku/modules/chat/widgets/chat_widget.dart';
import 'package:okiku/modules/history/controller/history_controller.dart';
import 'package:okiku/modules/history/widget/list_history.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/themes/app_color.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final Homecontroller homeController = Get.find<Homecontroller>();
  final ChatController chatController = Get.find<ChatController>();
  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundCream,
      resizeToAvoidBottomInset: true, // agar isi naik saat keyboard muncul
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCream,

        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Journal',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        
      ),

      // BODY — dibungkus dengan SafeArea + Expanded scroll
      body: Container(
        color: AppColor.backgroundCream,
        child: SafeArea(
          child: GestureDetector(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: Get.height * 0.25,
                          child: Image.asset(
                            'assets/logo/Logo3.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Sapaan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hi ',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.textDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${homeController.nama.value}, ',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.primaryYellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Let's see your history",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.textDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Kalender
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.accentOlive,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 25,
                                  color: AppColor.backgroundCream,
                                ),
                                Obx(
                                  () => Text(
                                    historyController.monthDis.value,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.backgroundCream,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    historyController.pickMonth(context);
                                    historyController.expandedItems.clear();
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 35,
                                    color: AppColor.backgroundCream,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                          child: Container(
                            height: Get.height * 0.45,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColor.primaryYellow,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    16,
                                    8,
                                    8,
                                    8,
                                  ),
                                  child: Text(
                                    "Journal",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                ListHistory(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
