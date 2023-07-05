import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/services/di_service.dart';

void main() async {
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      // initialBinding: BindService(),
      // getPages: [
      //   GetPage(
      //     name: MainPage.id,
      //     page: () => const MainPage(),
      //     binding: BindService(),
      //   )
      // ],
    );
  }
}
