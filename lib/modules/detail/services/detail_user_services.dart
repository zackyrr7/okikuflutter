import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:okiku/constant.dart';
import 'package:okiku/helper/helper.dart';

class DetailUserServices {
 Future<Map<String, dynamic>> simpanDetail(
  String ttl,
  String gender,
  String pekerjaan,
) async {
  try {
    var token = await Helper().readToken(); 
   
    var urlApi = Uri.parse('$url/simpanDetail');

    var response = await http.post(
      urlApi,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: json.encode({
        'ttl': ttl,
        'gender': gender,
        'pekerjaan': pekerjaan,
      }),
    );
print(response.statusCode);
print(response.body);
  

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      await Helper().deleteToken();
      return {'status': false, 'message': 'Token Expired'};
    } else {
      return {
        'status': false,
        'message': 'Gagal menyimpan data kamu, silakan coba lagi',
      };
    }
  } catch (e) {
    print('Error simpanDetail: $e');
    return {'status': false, 'message': 'Terjadi kesalahan: $e'};
  }
}
}
