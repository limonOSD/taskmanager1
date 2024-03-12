import 'package:get/get.dart';
import 'package:taskmanager1/presentation/state_holder.dart/auth_controller.dart';
import 'package:taskmanager1/presentation/state_holder.dart/splash_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put(AuthController());
  }
}
