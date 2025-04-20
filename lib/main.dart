import 'package:fabcurate/controller/category_controller.dart';
import 'package:fabcurate/controller/bottom_bar_controller.dart';
import 'package:fabcurate/controller/home_controller.dart';
import 'package:fabcurate/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  dependencies();
  runApp(
    GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: "FAB CURATE",
      initialRoute: Routes.bottomNavbar,
      getPages: Routes.getPages,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
    ),
  );
}

void dependencies() {
  Get.lazyPut(() => BottomNavbarController(), fenix: true);
  Get.lazyPut(() => HomeController(), fenix: true);
  Get.lazyPut(() => CategoryController(), fenix: true);
}
