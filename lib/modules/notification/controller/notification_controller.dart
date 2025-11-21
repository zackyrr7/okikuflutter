import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/notification/services/notification_services.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final NotificationServices _notificationServices = NotificationServices();

  var deviceToken = ''.obs;

  Future<void> initFirebase() async {
    await Firebase.initializeApp();

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );


    //Kalau lagi ngoding di ios ini di matikan
    // if (Platform.isIOS) {
    //   String? apnsToken = await _messaging.getAPNSToken();
    // }

    String? token = await _messaging.getToken();
    print("token ${token}");
    if (token != null) {
      deviceToken.value = token;
    }
    simpanTokenId();
  }

  Future<void> simpanTokenId() async {
    final tokenID = deviceToken.value;
    print({'tokenID : $tokenID'});
    

    try {
      var result = await _notificationServices.simpanTokenId(tokenID);

      if (result['status'] == true) {
        print('tersimpan');
        return;
      }
    } catch (e) {
        Get.snackbar('Error', 'Terjadi error: $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initFirebase();
   
  }
}
