import 'package:flutter/material.dart';
import 'package:navigationbar/nav.dart';
// import 'package:navigationbar/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:navigationbar/pages/datail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [GetPage(name: "/home", page: () => Nav()),
       GetPage(name: "/detail/:id", page: () => const DetailPage())
    ],
    );
  }
}
