import 'dart:convert';

import 'package:okiku/constant.dart';
import 'package:okiku/helper/helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatService {
  Future<Map<String, dynamic>> chatKiku(String line) async {
    try {
      final token = await Helper().readToken();
      // print(token);

      // Cek token
      if (token == null || token.isEmpty) {
        Get.defaultDialog(
          title: 'Error',
          middleText: "Sesi kamu sudah habis",
          textConfirm: 'OK',
          onConfirm: () {
            Get.offAllNamed('/login');
          },
        );

        // Tetap return Map agar konsisten
        return {'status': false, 'message': 'Token tidak ditemukan'};
      }

      // Request API dengan Bearer token
      final response = await http.post(
        Uri.parse('$url/postLine'),

        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({'line': line}),
      );

      // Cek status kode
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == true) {
        return {'status': true, 'data': data};
      } else {
        return {
          'status': false,
          'message': 'Gagal memuat data (${response.statusCode})',
        };
      }
    } catch (e) {
      return {'status': false, 'message': 'Terjadi kesalahan server: $e'};
    }
  }
}
