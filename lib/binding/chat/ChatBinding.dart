import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

import 'package:okiku/modules/chat/controller/chat_controller.dart';

class Chatbinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatController>(ChatController());
  }
}
