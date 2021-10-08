import 'package:flutter_jokkoo/controller/jokkoo_controller.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(JokkooController());
  }
}
