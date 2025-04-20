import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../controller/home_controller.dart';
import '../widgets/home/sticky_menu_section.dart';
import '../widgets/home/image_carousel_section.dart';
import '../widgets/home/category_section.dart';
import '../widgets/home/fabric_section.dart';
import '../widgets/home/unstitched_section.dart';
import '../widgets/home/boutique_section.dart';
import '../widgets/home/pattern_section.dart';
import '../widgets/home/occasion_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: _buildBody(),
              );
      }),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          "images/bg_logo.png",
          height: 28,
        ),
        actions: [
          Row(children: [
            Image.asset(
              "images/ic_search.png",
              height: 20,
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: badges.Badge(
                position: badges.BadgePosition.topStart(start: 18),
                badgeStyle: const badges.BadgeStyle(badgeColor: Colors.grey),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    "images/ic_cart.png",
                    height: 24,
                  ),
                ),
              ),
            )
          ])
        ],
      );

  Widget _buildBody() => Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StickyMenuSection(controller: controller),
              const SizedBox(height: 20),
              ImageCarouselSection(controller: controller),
              CategorySection(controller: controller),
              FabricSection(controller: controller),
              const SizedBox(height: 5),
              if (controller.unstitched.isNotEmpty)
                UnstitchedSection(controller: controller),
              BoutiqueSection(controller: controller),
              if (controller.patternItems.isNotEmpty)
                PatternSection(controller: controller),
              const SizedBox(height: 15),
              if (controller.occasionItems.isNotEmpty)
                OccasionSection(controller: controller),
            ],
          ),
        ),
      );
}
