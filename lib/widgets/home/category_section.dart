import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../widgets/common/network_image.dart';
import '../../widgets/common/section_title.dart';

class CategorySection extends StatelessWidget {
  final HomeController controller;

  const CategorySection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.shopByCategory.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Shop By Category'),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.shopByCategory.length,
            itemBuilder: (context, index) => _buildCategoryItem(index),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(int index) {
    final item = controller.shopByCategory[index];

    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomNetworkImage(
              url: item.image ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Get.width,
            color: Colors.blueGrey.shade50,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (item.name ?? '').toUpperCase(),
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  (item.tintColor ?? '').toUpperCase(),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
