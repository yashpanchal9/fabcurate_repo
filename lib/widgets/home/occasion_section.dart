import 'dart:ui';
import 'package:flutter/material.dart';
import '../../controller/home_controller.dart';
import '../../widgets/common/network_image.dart';
import '../../widgets/common/section_title.dart';

class OccasionSection extends StatelessWidget {
  final HomeController controller;

  const OccasionSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.occasionItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Design As Per Occasion'),
        SizedBox(
          height: 165,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.occasionItems.length,
            itemBuilder: (context, index) => _buildOccasionItem(index),
          ),
        ),
      ],
    );
  }

  Widget _buildOccasionItem(int index) {
    final item = controller.occasionItems[index];

    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.22),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          CustomNetworkImage(
            url: item.image ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 140,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (item.name ?? '').toUpperCase(),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              (item.subName ?? '').toUpperCase(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            (item.cta ?? '').toUpperCase(),
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
