import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:okiku/constant.dart';
import 'package:okiku/helper/helper.dart';

class ProfileServices {
  Future<Map<String, dynamic>> updateFoto(File? photo) async {
    try {
      final token = await Helper().readToken();

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
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$url/uploadFoto'),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(
        await http.MultipartFile.fromPath('photo', photo!.path),
      );
      // Cek status kode
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      final data = jsonDecode(response.body);
      print(data);

      if (response.statusCode == 200) {
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

  Future<Map<String, dynamic>> dataEmail() async {
    try {
      final token = await Helper().readToken();

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
      final response = await http.get(
        Uri.parse('$url/cekLogin'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
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
