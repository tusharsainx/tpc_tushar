import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:tpc_assignment/homepage/homepage.dart';
import 'package:tpc_assignment/homepage/homepage_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TPC_Tushar_assignment',
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: '/home',
          page: () => const GameHomepage(),
          binding: HomepageBinding(),
        )
      ],
    );
  }
}
