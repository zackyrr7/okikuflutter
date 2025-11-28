import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:okiku/modules/chat/services/chat_service.dart';
import 'package:okiku/modules/chat/widgets/streak_widget.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/themes/app_color.dart';
import 'package:intl/intl.dart';

class ChatController extends GetxController {
  var isLoading = false.obs;
  final ChatService _chatService = ChatService();
  final TextEditingController lineController = TextEditingController();
  var hasil = ''.obs;
  var lineText = ''.obs;
  var streak = ''.obs;
  var streakKalimat = ''.obs;
  var day = ''.obs;

  void setCurrentDate() {
    // set locale ke Indonesia
    final now = DateTime.now();
    final formatter = DateFormat('d MMMM yyyy', 'id'); // contoh: 1 Januari 2025
    day.value = formatter.format(now);
  }

  Future<void> chatLine() async {
    final line = lineController.text.trim(); // ✅ ambil teks dengan benar
    hasil.value = '';
    if (line.isEmpty) {
      Get.snackbar('Error', 'Isi semua data terlebih dahulu');
      return;
    }

    isLoading.value = true;

    try {
      final result = await _chatService.chatKiku(line);

      if (result['status'] == true) {
        final data = result['data'];
        hasil.value = data['message'] ?? '';
        lineText.value = line; // ✅ simpan teks user setelah sukses kirim
        lineController.clear();
        streak.value = data['streak'].toString();
        if (streak.value == '1') {
          streakKalimat.value = 'Streak Pertamamu sudah dimulai';
        } else {
          streakKalimat.value = 'Kamu sudah mencapai ${streak.value} streak';
        }
        Get.dialog(StreakWidget(streakKalimat: streakKalimat));
        Get.reload<Homecontroller>();
      } else {
        result['message'] == 'Kamu sudah cerita hari ini'
            ? Get.dialog(
              Center(
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
                        child: Image.asset('assets/logo/nguap.png', scale: 1),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          "~Meong~",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          "maaf human, Kamu sudah cerita hari ini \nsekarang saatnya kiku tidur",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            : Get.snackbar(
              'Gagal',
              result['message'] ?? 'Terjadi kesalahan',
              snackPosition: SnackPosition.BOTTOM,
            );
      }
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Terjadi kesalahan server: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
      lineController.clear(); // ✅ baru clear di sini (setelah selesai)
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setCurrentDate();
  }
}
