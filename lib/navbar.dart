import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/home/view/home_screen.dart';
import 'package:okiku/themes/app_color.dart';

class MyNavbar extends StatelessWidget {
  MyNavbar({super.key});
  final RxInt selectedIndex = 0.obs;

  final List<Widget> _screens = [HomeScreen(),  HomeScreen(), HomeScreen()];

  final List<IconData> _icons = [Icons.home, Icons.history, Icons.qr_code];

  void _onTapIndex(int index) {
    if (index == 1) return;
    selectedIndex.value = index < 1 ? index : index - 1;
   
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _screens[selectedIndex.value],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          child: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: Colors.white,
              elevation: 8,
              child: SizedBox(
                // height: 10, // ✅ Tinggi navbar diatur di sini
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (index) {
                    if (index == 1) {
                      return const SizedBox(width: 50); // space untuk FAB
                    }

                    final iconIndex = index < 1 ? index : index - 1;
                    final isSelected = selectedIndex.value == iconIndex;

                    return InkWell(
                      onTap: () => _onTapIndex(index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min, // penting
                        children: [
                          Icon(
                            _icons[iconIndex],
                            size: 26,
                            color: isSelected ? Colors.black : Colors.grey,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 70, // ubah sesuai kebutuhan
          height: 70,
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: AppColor.accentBurntOrange,
            child: const Icon(Icons.add, size: 20), // ikon juga dikecilkan
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
