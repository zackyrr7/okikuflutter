import 'package:get/get.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/notification/controller/notification_controller.dart';


class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Homecontroller>(Homecontroller());
    Get.put<NotificationController>(NotificationController());
  }
}