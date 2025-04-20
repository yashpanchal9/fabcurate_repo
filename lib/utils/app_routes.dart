import 'package:fabcurate/controller/category_controller.dart';
import 'package:fabcurate/view/category_view.dart';
import 'package:fabcurate/controller/bottom_bar_controller.dart';
import 'package:fabcurate/view/bottom_bar.dart';
import 'package:fabcurate/controller/home_controller.dart';
import 'package:fabcurate/view/home_view.dart';
import 'package:get/get.dart';

class Routes {
  static const bottomNavbar = '/bottomNavbar';
  static const homeViewPage = '/homeViewPage';
  static const categoryViewPages = '/categoryViewPages ';

  static List<GetPage<dynamic>> get getPages {
    return [
      GetPage(
        name: bottomNavbar,
        page: () => const BottomNavbar(),
        binding: BindingsBuilder.put(
          () => BottomNavbarController(),
        ),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: homeViewPage,
        page: () => const HomeView(),
        binding: BindingsBuilder.put(
          () => HomeController(),
        ),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: categoryViewPages,
        page: () => const CategoryViewPage(),
        binding: BindingsBuilder.put(
          () => CategoryController(),
        ),
        transition: Transition.rightToLeftWithFade,
      ),
    ];
  }
}
