import 'dart:convert';

import 'package:get/get.dart';
import 'package:okiku/constant.dart';
import 'package:okiku/helper/helper.dart';
import 'package:http/http.dart' as http;

class NotificationServices {
  Future<Map<String, dynamic>> simpanTokenId(String tokenID) async {
    var token = await Helper().readToken();
    print(token);
    var urlApi = Uri.parse('$url/simpanTokenId');
    
    try {
      var response = await http.post(
        urlApi,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: json.encode({'token': tokenID}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        await Helper().deleteToken();
        return {'status': false, 'message': 'Token Expired'};
      } else {
        return {'status': false, 'message': 'terjadi Kesalahan'};
      }
    } catch (e) {
      print('Error simpanDetail: $e');
      return {'status': false, 'message': 'Terjadi kesalahan: $e'};
    }
  }
}
