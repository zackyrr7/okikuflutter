import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/chat/controller/chat_controller.dart';
import 'package:okiku/modules/chat/widgets/chat_widget.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/themes/app_color.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final Homecontroller homeController = Get.find<Homecontroller>();
  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // agar isi naik saat keyboard muncul
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'New \nJournal',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.primaryYellow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
      ),

      // BODY — dibungkus dengan SafeArea + Expanded scroll
      body: SafeArea(
        child: GestureDetector(
          onTap:
              () =>
                  FocusScope.of(
                    context,
                  ).unfocus(), // 👉 Tutup keyboard saat tap di luar
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
                            '${homeController.nama.value}',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.primaryYellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ', How are you today?',
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
                        padding: const EdgeInsets.symmetric(horizontal: 24),
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
                              Text(
                                '1 Januari 2025',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.backgroundCream,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
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

                      ChatKiku(),
                      // Pesan kucing
                    ],
                  ),
                ),
              ),

              // Input Text (pindahkan ke bawah agar otomatis naik saat keyboard muncul)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  color: AppColor.backgroundCream,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: chatController.lineController,

                    maxLines: 4,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Tell me your day...',
                      hintStyle: const TextStyle(color: Colors.black54),
                      suffixIcon: IconButton(
                        onPressed: () {
                          chatController.chatLine();
                          chatController.lineText.value =
                              chatController.lineController.text;
                          chatController.lineController.clear();
                        },
                        icon: const Icon(Icons.send),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
