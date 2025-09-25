import 'package:get/get.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/navbar/navbar_controller.dart';
import 'package:okiku/modules/notification/controller/notification_controller.dart';


class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationController>(NotificationController());
    Get.put<Homecontroller>(Homecontroller());
    Get.put<NavbarController>(NavbarController());
  }
}