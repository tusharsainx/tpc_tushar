import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tpc_assignment/assets/assets_helper.dart';
import 'package:tpc_assignment/homepage/homepage_controller.dart';

class GameAppBarRetry extends GetView<HomepageController> {
  const GameAppBarRetry({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(color: Color(0xffBF271F)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: GestureDetector(
              onTap: controller.reset,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Reset Game",
                    style: GoogleFonts.silkscreen(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    FontAwesomeIcons.rotateRight,
                    color: Colors.white,
                    size: 14,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
