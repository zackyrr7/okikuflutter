import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:okiku/constant.dart';
import 'package:okiku/helper/helper.dart';

class AuthServices {
  Future<Map<String, dynamic>> loginGoogle(
    String email,
    String name,
    String googleId,
  ) async {
    try {
      // String? token = await Helper().readToken();
      // if (token == null) {
      //   return {'status': false, 'message': 'Token tidak ditemukan'};
      // }

      var response = await http.post(
        Uri.parse('$url/googleSignIn'),
        //  body: email,name,googleId
        body: {'email': email, 'name': name, 'googleId': googleId},
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        String token2 = data['token'];
        final FlutterSecureStorage storage = FlutterSecureStorage();
        storage.write(key: 'token', value: token2);
      
        return data;
      } else {
        return {
          'status': false,
          'message': 'Login Gagal, Periksa username dan password anda',
        };
      }
    } catch (e) {
      return {'status': false, 'message': 'Terjadi kesalahan; $e'};
    }
  }

  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      var response = await http.post(
        Uri.parse('$url/register'),
        body: {'email': email, 'name': name, 'password': password},
      );


      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        String token2 = data['token'];
        final FlutterSecureStorage storage = FlutterSecureStorage();
        storage.write(key: 'token', value: token2);
        return data;
      } else {
        return {'status': false, 'message': 'Register Gagal.'};
      }
    } catch (e) {
      return {'status': false, 'message': 'Terjadi kesalahan; $e'};
    }
  }
  Future<Map<String, dynamic>> login(
   
    String email,
    String password,
  ) async {
    try {
      var response = await http.post(
        Uri.parse('$url/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        String token2 = data['token'];
        final FlutterSecureStorage storage = FlutterSecureStorage();
        storage.write(key: 'token', value: token2);
        return data;
      } else {
        return {'status': false, 'message': 'Register Gagal.'};
      }
    } catch (e) {
      return {'status': false, 'message': 'Terjadi kesalahan; $e'};
    }
  }
}
