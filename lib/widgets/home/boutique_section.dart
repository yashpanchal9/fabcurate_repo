import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../widgets/common/network_image.dart';
import '../../widgets/common/rich_text_helper.dart';
import '../../widgets/common/section_title.dart';

class BoutiqueSection extends StatelessWidget {
  final HomeController controller;

  const BoutiqueSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.boutiqueCollection.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Boutique Collection'),
        CarouselSlider(
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              controller.sliderCarouselIndex.value = index;
            },
          ),
          items: controller.boutiqueCollection
              .map((item) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey[300],
                    ),
                    child: Stack(
                      children: [
                        CustomNetworkImage(
                          url: item.bannerImage ?? '',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              stops: [0.5, 1.0],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 20,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomRichText(
                                  text: item.name?.toUpperCase() ?? ''),
                              const SizedBox(height: 15),
                              Text(
                                (item.cta ?? '').toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.boutiqueCollection.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: controller.sliderCarouselIndex.value == i ? 12 : 8,
                  height: controller.sliderCarouselIndex.value == i ? 12 : 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(
                      controller.sliderCarouselIndex.value == i ? 0.9 : 0.4,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
