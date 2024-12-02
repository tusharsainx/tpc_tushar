import 'dart:ffi';

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
      body: Row(
        children: [
          SizedBox(
            width: 180,
            child: Obx(() {
              return (controller.currentTurn.value == 0)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: controller.startGame,
                        child: Container(
                          width: 180,
                          // alignment: Alignment.center,
                          decoration:
                              const BoxDecoration(color: Color(0xffBF271F)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Start Game",
                              style: GoogleFonts.silkscreen(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : (controller.currentTurn.value == 1)
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Bot's turn",
                                style: GoogleFonts.silkscreen(
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                color: Colors.red,
                                height: 10,
                                width: 10,
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Your's turn",
                                style: GoogleFonts.silkscreen(
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                color: Colors.green,
                                height: 10,
                                width: 10,
                              )
                            ],
                          ),
                        );
            }),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.height  * 0.8,
            height: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
                color: const Color(0xffDBA600),
                borderRadius: BorderRadius.circular(35)),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 7,
              children: List.generate(42, (index) {
                return GestureDetector(
                  onTap: () =>
                      controller.dropDisk(index, controller.currentTurn.value),
                  child: Obx(() {
                    return Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Color(controller.colors[index]),
                          shape: BoxShape.circle),
                    );
                  }),
                );
              }).toList(),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
