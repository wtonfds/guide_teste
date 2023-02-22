import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_ti/src/configs/app_pages.dart';
import 'package:guide_ti/src/configs/app_routes.dart';
import 'package:guide_ti/src/features/home/presentation/bindings/home_binding.dart';

import 'src/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guide Investimentos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.cyan.shade900
        )
      ),
      getPages: AppPages.pages,
      initialBinding: HomeBinding(),
      initialRoute: AppRoutes.home,
    );
  }
}

