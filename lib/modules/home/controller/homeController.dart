import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  final storage = FlutterSecureStorage();


  Future<void> logout() async {
    storage.deleteAll();
    Get.offAndToNamed('/login');
  }
}