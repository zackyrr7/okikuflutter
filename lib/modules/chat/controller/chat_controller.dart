import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/chat/services/chat_service.dart';

class ChatController extends GetxController {
  var isLoading = false.obs;
  final ChatService _chatService = ChatService();
  final TextEditingController lineController = TextEditingController();
  var hasil = ''.obs;
  var lineText = ''.obs;

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
      } else {
        Get.snackbar(
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
}
