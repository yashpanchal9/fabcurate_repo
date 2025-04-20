import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../controller/home_controller.dart';
import '../../widgets/common/network_image.dart';
import '../../widgets/common/section_title.dart';

class UnstitchedSection extends StatelessWidget {
  final HomeController controller;

  const UnstitchedSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.unstitched.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Unstitched'),
        CarouselSlider.builder(
          itemCount: controller.unstitched.length,
          itemBuilder: (context, index, realIndex) {
            final item = controller.unstitched[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomNetworkImage(
                    url: item.image ?? '',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            (item.description ?? '').toUpperCase(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            (item.name ?? '').toUpperCase(),
                            style: TextStyle(
                              color: Colors.orangeAccent.withOpacity(0.85),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: 360,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.66,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            pageSnapping: true,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlayInterval: const Duration(seconds: 3),
          ),
        ),
      ],
    );
  }
}
