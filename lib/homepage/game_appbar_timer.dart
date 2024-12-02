import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpc_assignment/homepage/homepage_controller.dart';

class GameAppBarTimer extends GetView<HomepageController> {
  const GameAppBarTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.timerDuration.value;
      return Text(
        controller.getDisplayableTimerValue(),
        style: const TextStyle(color: Colors.white),
      );
    });
  }
}
