import 'package:get/get.dart';

import 'authController.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
