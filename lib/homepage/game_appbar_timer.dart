import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tpc_assignment/assets/assets_helper.dart';
import 'package:tpc_assignment/homepage/homepage_controller.dart';

class GameAppBarTimer extends GetView<HomepageController> {
  const GameAppBarTimer({super.key});

  @override
  Widget build(BuildContext context) {
    print(AssetHelper.clock);
    return Obx(
      () {
        controller.timerDuration.value;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetHelper.clock,
              height: 14,
              width: 10,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              controller.getDisplayableTimerValue(),
              style: GoogleFonts.silkscreen(
                textStyle: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }
}
