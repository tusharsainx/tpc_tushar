import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tpc_assignment/homepage/game_appbar_retry_action.dart';
import 'package:tpc_assignment/homepage/game_appbar_timer.dart';
import 'package:tpc_assignment/homepage/homepage_controller.dart';

class GameHomepage extends GetView<HomepageController> {
  const GameHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222222),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        automaticallyImplyLeading: false,
        actions: [
          const GameAppBarTimer(),
          SizedBox(
            width: Get.width * 0.2,
          ),
          const GameAppBarRetry(),
        ],
        title: Text("Connect 4",
            style: GoogleFonts.silkscreen(
              textStyle: const TextStyle(
                  fontSize: 32,
                  color: Color(0xffDBA600),
                  fontWeight: FontWeight.w700),
            )),
      ),
      body: Center(
          child: Container(
        width: Get.height * 0.6,
        height: Get.width * 0.6,
        decoration: BoxDecoration(
            color: const Color(0xffDBA600),
            borderRadius: BorderRadius.circular(35)),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 7,
          children: List.generate(42, (index) {
            return GestureDetector(
              onTap: () => controller.dropDisk(index),
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color(0xff37311B), shape: BoxShape.circle),
              ),
            );
          }).toList(),
        ),
      )),
    );
  }
}
