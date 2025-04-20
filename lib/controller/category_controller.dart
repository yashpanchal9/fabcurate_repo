import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/category_item_model.dart';
import '../service/api_service.dart';

class CategoryController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<CategoryData> categories = <CategoryData>[].obs;
  final ApiService _apiService = ApiService();
  String? bannerImage;

  @override
  void onInit() {
    super.onInit();
    getCategoryData();
  }

  Future<void> getCategoryData() async {
    try {
      isLoading.value = true;
      final response =
          await _apiService.get('/category_repository.json', headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final CategoryItem allItems = categoryItemFromMap(response.body);
        categories.value = allItems.categories;
        bannerImage = allItems.bannerImage;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log("Error loading items: $e");
      Get.snackbar(
        'Error',
        'Failed to load categories',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[900],
      );
    } finally {
      isLoading.value = false;
    }
  }
}
