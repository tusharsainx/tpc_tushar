import 'package:get/get.dart';
import 'package:connect4/homepage/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomepageController());
  }
}
