import 'package:get/get.dart';
import 'package:tpc_assignment/homepage/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomepageController());
  }
}
