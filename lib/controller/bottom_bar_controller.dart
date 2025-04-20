import 'package:fabcurate/view/category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/home_view.dart';

class BottomNavbarController extends GetxController {
  final currentIndex = 0.obs;

  Widget _buildPlaceholderPage(IconData icon, String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.lightGreen),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen),
          ),
        ],
      ),
    );
  }

  late final List<Widget> pages;

  @override
  void onInit() {
    super.onInit();

    pages = [
      const HomeView(),
      const CategoryViewPage(),
      _buildPlaceholderPage(Icons.cabin, 'Curate'),
      _buildPlaceholderPage(Icons.energy_savings_leaf, 'Sale'),
      _buildPlaceholderPage(Icons.more_horiz, 'More'),
    ];

  }

  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home_outlined, 'label': 'HOME'},
    {'icon': Icons.category, 'label': 'CATEGORY'},
    {'icon': Icons.cabin, 'label': 'CURATE'},
    {'icon': Icons.energy_savings_leaf, 'label': 'SALE'},
    {'icon': Icons.more_horiz, 'label': 'MORE'},
  ];

  void changePage(int index) {
    currentIndex.value = index;
    _loadPageData(index);
  }

  void _loadPageData(int index) {
  }
}
