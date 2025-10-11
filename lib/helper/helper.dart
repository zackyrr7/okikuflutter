import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';


class Helper {
  static final _storage = FlutterSecureStorage();
  

  Future<String?> readToken() async {
    String? token = await _storage.read(key: 'token');
    if (token!=  null) {
      return token;
    } else {
      return null;
    }
  }
   String dateFormat(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String dateIndo(String tanggal) {
  DateTime parsedDate = DateTime.parse(tanggal); // dari yyyy-MM-dd
  String formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(parsedDate);
  return formattedDate;
}

Future<void> deleteToken() async{
  await _storage.deleteAll();
  Get.offAndToNamed('/login');
  return;
  
}





}