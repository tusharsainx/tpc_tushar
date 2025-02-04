import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:connect4/homepage/homepage.dart';
import 'package:connect4/homepage/homepage_binding.dart';

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
      title: 'Connect 4',
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
