import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:badges/badges.dart' as badges;

import '../controller/category_controller.dart';

class CategoryViewPage extends GetView<CategoryController> {
  const CategoryViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Category",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
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
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 3),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'images/bg_placeholder.png',
                      image: controller.bannerImage ?? '',
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        log("Error loading image: $error");
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.error_outline,
                                size: 50, color: Colors.red),
                          ),
                        );
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            category.categoryName ?? 'Unnamed Category',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black54,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
