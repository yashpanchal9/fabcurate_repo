import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../widgets/common/network_image.dart';

class ImageCarouselSection extends StatelessWidget {
  final HomeController controller;

  const ImageCarouselSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.sliderImages.isEmpty) {
        return const SizedBox.shrink();
      }

      return CarouselSlider(
        options: CarouselOptions(
          height: 170,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: controller.sliderImages
            .map((item) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[300],
                  ),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: CustomNetworkImage(
                        url: item.image ?? '',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 40,
                      right: 40,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (item.title ?? '').toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              (item.cta ?? '').toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ))
            .toList(),
      );
    });
  }
}
