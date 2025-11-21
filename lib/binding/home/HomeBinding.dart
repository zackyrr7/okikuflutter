import 'package:get/get.dart';
import 'package:okiku/modules/chat/controller/chat_controller.dart';
import 'package:okiku/modules/history/controller/history_controller.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/navbar/navbar_controller.dart';
import 'package:okiku/modules/notification/controller/notification_controller.dart';
import 'package:okiku/modules/profile/controller/profile_controller.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationController>(NotificationController());
    Get.put<Homecontroller>(Homecontroller());
    Get.put<NavbarController>(NavbarController());
    Get.put<ChatController>(ChatController());
    Get.put<HistoryController>(HistoryController());
    Get.put<ProfileController>(ProfileController());
  }
}
