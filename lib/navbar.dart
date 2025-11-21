import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/chat/screen/chat_screen.dart';
import 'package:okiku/modules/history/screen/history_screen.dart';
import 'package:okiku/modules/home/view/home_screen.dart';
import 'package:okiku/modules/navbar/navbar_controller.dart';
import 'package:okiku/modules/profile/view/profile_screen.dart';
import 'package:okiku/themes/app_color.dart';

class MyNavbar extends StatelessWidget {
  MyNavbar({super.key});
  final NavbarController navbarController = Get.find<NavbarController>();

  final List<Widget> _screens = [
    ChatScreen(),
    HistoryScreen(),
    HomeScreen(),
    ProfileScreen(),
    // HomeScreen(),
  ];

  final List<IconData> _icons = [
    Icons.edit,
    Icons.article,
    Icons.home,
    Icons.person,
    // Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            _screens[navbarController.selectedIndex.value],

            //
            // buildNavbar(icons: _icons, navbarController: navbarController),
            Obx(
              () => AnimatedPositioned(
                duration: Duration(milliseconds: 300),
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
                  child:
                      navbarController.isExpanded.value
                          ? buildNavbar(
                            icons: _icons,
                            navbarController: navbarController,
                          )
                          : _buildIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class buildNavbar extends StatelessWidget {
  const buildNavbar({
    super.key,
    required List<IconData> icons,
    required this.navbarController,
  }) : _icons = icons;

  final List<IconData> _icons;
  final NavbarController navbarController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: Get.height * 0.05),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // height: 20,
        width: Get.width * 0.7,
        decoration: BoxDecoration(
          color: AppColor.textDark,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(_icons.length, (index) {
              bool isSelected = navbarController.selectedIndex.value == index;
              return GestureDetector(
                onTap: () {
                  navbarController.changePage(index);
                  if (index == 0) {
                    navbarController.isExpanded.value = false;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _icons[index],
                        size: 28,
                        color:
                            isSelected
                                ? AppColor.primaryYellow
                                : AppColor.backgroundCream,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        margin: EdgeInsets.only(top: 6),
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
          ],
        ),
      ),
    );
  }
}

Widget _buildIndicator() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        margin: EdgeInsets.only(
          bottom: Get.height * 0.05,
        ), // sama seperti navbar
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: Get.height * 0.075,
        // width: Get.width * 0.4,
        decoration: BoxDecoration(
          color: AppColor.textDark.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset('assets/icons/7.png', fit: BoxFit.contain),
      ),
    ),
  );
}
