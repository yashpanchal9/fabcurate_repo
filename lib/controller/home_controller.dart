import 'package:fabcurate/model/top_item_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../model/bottom_item_model.dart';
import '../model/middle_item_model.dart';
import '../service/api_service.dart';

class HomeController extends GetxController {
  var carouselIndex = 0.obs;
  var sliderCarouselIndex = 0.obs;

  var patternItems = <RangeOfPattern>[].obs;
  var occasionItems = <DesignOccasion>[].obs;
  var shopByCategory = <ShopByCategory>[].obs;
  var shopByFabric = <ShopByFabric>[].obs;
  var unstitched = <Unstitched>[].obs;
  var boutiqueCollection = <BoutiqueCollection>[].obs;
  var mainStickyMenu = <MainStickyMenu>[].obs;
  var sliderImages = <SliderImage>[].obs;

  var isLoading = true.obs;
  var currentIndex = 0.obs;
  var selectedMenu = 0.obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    _fetchAllData();
  }

  Future<void> _fetchAllData() async {
    isLoading.value = true;

    try {
      await Future.wait([
        fetchTopItems(),
        fetchMiddleItems(),
        fetchBottomItems(),
      ]);

      if (mainStickyMenu.isNotEmpty) {
        updateSliderImages(0);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading data: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTopItems() async {
    try {
      final response = await _apiService.get('/top_repository.json');
      final TopItem allItems = topItemFromMap(response.body);
      mainStickyMenu.value = allItems.mainStickyMenu;

      if (mainStickyMenu.isNotEmpty) {
        sliderImages.value = mainStickyMenu[0].sliderImages;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading top items: $e');
      }
      mainStickyMenu.value = [];
      sliderImages.value = [];
    }
  }

  Future<void> fetchMiddleItems() async {
    try {
      final response = await _apiService.get('/middle_repository.json');
      final MiddleItem allItems = middleItemFromMap(response.body);

      shopByCategory.value = allItems.shopByCategory;
      shopByFabric.value = allItems.shopByFabric;
      unstitched.value = allItems.unstitched;
      boutiqueCollection.value = allItems.boutiqueCollection;
    } catch (e) {
      if (kDebugMode) {
        print('Error loading middle items: $e');
      }
      shopByCategory.value = [];
      shopByFabric.value = [];
      unstitched.value = [];
      boutiqueCollection.value = [];
    }
  }

  Future<void> fetchBottomItems() async {
    try {
      final response = await _apiService.get('/bottom_repository.json');
      final BottomItem allItems = bottomItemFromMap(response.body);

      patternItems.value = allItems.rangeOfPattern;
      occasionItems.value = allItems.designOccasion;
    } catch (e) {
      if (kDebugMode) {
        print('Error loading bottom items: $e');
      }
      patternItems.value = [];
      occasionItems.value = [];
    }
  }

  void updateSliderImages(int index) {
    if (index < 0 || index >= mainStickyMenu.length) return;

    selectedMenu.value = index;
    sliderImages.value = mainStickyMenu[index].sliderImages;
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  Future<void> refreshData() async {
    isLoading.value = true;
    await _fetchAllData();
  }
}
