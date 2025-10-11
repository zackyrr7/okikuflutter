import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/home/view/home_screen.dart';
import 'package:okiku/modules/navbar/navbar_controller.dart';
import 'package:okiku/themes/app_color.dart';

class MyNavbar extends StatelessWidget {
  MyNavbar({super.key});
  final NavbarController navbarController = Get.find<NavbarController>();

  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  final List<IconData> _icons = [
    Icons.edit,
    Icons.article,
    Icons.home,
    Icons.person,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // penting agar keyboard tidak nutup layout
      body: Obx(
        () {
          // deteksi apakah keyboard muncul
          final bool isKeyboardVisible =
              MediaQuery.of(context).viewInsets.bottom > 0;

          return Stack(
            children: [
              _screens[navbarController.selectedIndex.value],

              // hanya tampilkan navbar kalau keyboard tidak muncul
              if (!isKeyboardVisible)
                Obx(
                  () => AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    left: 0,
                    right: 0,
                    bottom: navbarController.isExpanded.value ? 20 : -80,
                    child: GestureDetector(
                      onVerticalDragEnd: (details) {
                        if (details.primaryVelocity != null) {
                          if (details.primaryVelocity! > 6) {
                            navbarController.isExpanded.value = false;
                          } else if (details.primaryVelocity! < -6) {
                            navbarController.isExpanded.value = true;
                          }
                        }
                      },
                      child: navbarController.isExpanded.value
                          ? BuildNavbar(
                              icons: _icons,
                              navbarController: navbarController,
                            )
                          : _buildIndicator(),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class BuildNavbar extends StatelessWidget {
  const BuildNavbar({
    super.key,
    required List<IconData> icons,
    required this.navbarController,
  }) : _icons = icons;

  final List<IconData> _icons;
  final NavbarController navbarController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: Get.height * 0.05),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: Get.width * 0.7,
        decoration: BoxDecoration(
          color: AppColor.textDark,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_icons.length, (index) {
            bool isSelected = navbarController.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => navbarController.changePage(index),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _icons[index],
                      size: 28,
                      color: isSelected
                          ? AppColor.primaryYellow
                          : AppColor.backgroundCream,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(top: 6),
                      height: 3,
                      width: isSelected ? 20 : 0,
                      decoration: BoxDecoration(
                        color: AppColor.primaryYellow,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

Widget _buildIndicator() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Container(
        height: Get.height * 0.07,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    ),
  );
}
