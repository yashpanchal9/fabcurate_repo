import 'package:flutter/material.dart';
import '../../controller/home_controller.dart';
import '../../widgets/common/circular_item.dart';
import '../../widgets/common/section_title.dart';

class PatternSection extends StatelessWidget {
  final HomeController controller;

  const PatternSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.patternItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Range of Pattern'),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.patternItems.length,
            itemBuilder: (context, index) {
              final item = controller.patternItems[index];
              return CircularItem(
                image: item.image ?? '',
                name: item.name ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}
