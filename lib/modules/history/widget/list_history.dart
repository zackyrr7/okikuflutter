import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/history/controller/history_controller.dart';
import 'package:okiku/themes/app_color.dart';

class ListHistory extends StatelessWidget {
  ListHistory({super.key});

  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Obx(
          () => ListView.builder(
            itemCount: historyController.historyData.length,
            padding: const EdgeInsets.only(bottom: 8),
            itemBuilder: (context, index) {
              // 🔥 Bungkus setiap item dengan Obx agar masing-masing reaktif
              return Obx(() {
                final data = historyController.historyData[index];
                final isExpanded = historyController.isExpanded(index);

                return AnimatedSize(
                  key: ValueKey(index),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                        
                          historyController.toggleExpand(index);
                          final current = historyController.isExpanded(index);
                         
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColor.backgroundCream,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.dayShort.toUpperCase(),
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          data.dateShort,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        data.line,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0.0,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOut,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColor.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // 🔽 Bagian detail expand
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: AlignmentGeometry.centerLeft,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.13,
                                          height: Get.width * 0.13,
                                          child: Image.asset(
                                            'assets/logo/Angry.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          'Respon Kiku',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    textAlign: TextAlign.justify,
                                    data.respon,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: AlignmentGeometry.centerLeft,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.13,
                                          height: Get.width * 0.13,
                                          child: Image.asset(
                                            'assets/logo/Angry.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          'Mood',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${data.emotion}, ",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: data.deskripsi),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                        crossFadeState:
                            isExpanded
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDetailBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 13)),
    );
  }
}
