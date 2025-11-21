import 'package:get/get.dart';

import 'package:okiku/modules/history/controller/history_controller.dart';

class Historybinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HistoryController>(HistoryController());
  }
}
