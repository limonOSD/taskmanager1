import 'package:get/get.dart';
import 'package:taskmanager1/presentation/state_holder.dart/auth_controller.dart';

class SplashScreenController extends GetxController {
  goToNextScreen() async {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.find<AuthController>().checkUser());
  }
}
