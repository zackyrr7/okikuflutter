import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:okiku/modules/chat/controller/chat_controller.dart';
import 'package:okiku/themes/app_color.dart';

class ChatKiku extends StatelessWidget {
  ChatKiku({super.key});

  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🐾 Chat dari Kiku (default pembuka)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/logo/karakter.png', height: 44, width: 50),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Purr… tell me, was your day paw-some or just meh? '
                    'I’ve been curious all day, so don’t keep this kitty waiting~',
                    style: TextStyle(color: AppColor.textDark, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // 💬 Chat user (jika ada input)
          Obx(() {
            final textUser = chatController.lineText.value.trim();
            if (textUser.isEmpty) return const SizedBox.shrink();

            return Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Card(
                  color: AppColor.backgroundCream,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(textUser, style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 16),

          Obx(() {
            if (chatController.isLoading.value == true) {
              return Lottie.asset(
                'assets/lottie/cat.json',
                height: 120,
                repeat: true,
                reverse: false,
                frameRate: FrameRate(
                  60,
                ), // default 60, kecilkan untuk melambatkan
                animate: true,
              );
              
            } else {
              final hasil = chatController.hasil.value.trim();
              if (hasil.isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/logo/karakter.png',
                      height: 44,
                      width: 50,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        hasil,
                        style: TextStyle(
                          color: AppColor.textDark,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
