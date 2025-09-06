import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/auth/controller/auth_controller.dart';
import 'package:okiku/modules/home/controller/homeController.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final Homecontroller homecontroller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cek'),
        actions: [IconButton(onPressed: () {
homecontroller.logout();
        }, icon: Icon(Icons.logout))],
      ),
    );
  }
}
