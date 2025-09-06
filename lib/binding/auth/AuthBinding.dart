import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/auth/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}