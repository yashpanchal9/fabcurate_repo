import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../widgets/common/network_image.dart';

class StickyMenuSection extends StatelessWidget {
  final HomeController controller;

  const StickyMenuSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: controller.mainStickyMenu.length,
        itemBuilder: (context, index) => _buildMenuItem(index),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }

  Widget _buildMenuItem(int index) {
    final item = controller.mainStickyMenu[index];

    return Obx(() {
      final isSelected = controller.selectedMenu.value == index;

      return GestureDetector(
        onTap: () => controller.updateSliderImages(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            width: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: isSelected ? Colors.black : Colors.transparent,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: CustomNetworkImage(
                    url: item.image ?? '',
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IntrinsicHeight(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      alignment: Alignment.center,
                      child: Text(
                        item.title ?? '',
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
