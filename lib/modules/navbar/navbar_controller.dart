import 'package:get/get.dart';

class NavbarController extends GetxController{
  var selectedIndex = 2.obs;
  var isExpanded = true.obs;

  void changePage(int index){
    selectedIndex.value = index;
  }
}