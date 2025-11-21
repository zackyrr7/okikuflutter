import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/themes/app_color.dart';

class History extends StatelessWidget {
  History({super.key});
  final Homecontroller homecontroller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            child: Text(
              "Journal",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Obx(
                () => ListView.builder(
                  itemCount: homecontroller.jurnalData.length,
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 8,
                  ),
                  itemBuilder: (context, index) {
                    if (index > homecontroller.jurnalData.length - 1) {
                      return SizedBox.shrink();
                    }
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      width: Get.width,
                      height: Get.height * 0.1,
                      decoration: BoxDecoration(
                        color: AppColor.backgroundCream,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ), // jarak isi ke pinggir
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Bagian kiri
                          Expanded(
                            // ⬅️ tambahkan ini biar teks wrap
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Kolom tanggal
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      homecontroller.jurnalData[index].dayShort
                                          .toUpperCase(),
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      homecontroller
                                          .jurnalData[index]
                                          .dateShort,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 12),

                                // Teks panjang
                                Expanded(
                                  child: Text(
                                    homecontroller.jurnalData[index].line,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow:
                                        TextOverflow
                                            .ellipsis, // kalau mau potong ...
                                    maxLines: 2, // maksimal 2 baris
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Bagian kanan
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
