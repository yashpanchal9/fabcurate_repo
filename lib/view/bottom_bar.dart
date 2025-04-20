import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bottom_bar_controller.dart';

class BottomNavbar extends GetView<BottomNavbarController> {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Obx(() => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changePage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.lightGreen,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 0,
            items: _buildNavItems(),
          ),
        ));
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return controller.navItems.asMap().entries.map((entry) {
      int idx = entry.key;
      Map<String, dynamic> item = entry.value;

      return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Icon(
            item['icon'],
            color: controller.currentIndex.value == idx
                ? Colors.lightGreen
                : Colors.grey,
          ),
        ),
        label: item['label'],
      );
    }).toList();
  }
}
