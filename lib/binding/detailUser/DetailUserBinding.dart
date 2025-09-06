import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/auth/controller/auth_controller.dart';
import 'package:okiku/modules/detail/controller/detailUserController.dart';

class Detailuserbinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailUserController>(DetailUserController());
  }
}