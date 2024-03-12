import 'package:get/get.dart';
import 'package:taskmanager1/presentation/ui/screens/loginscreen.dart';

class SplashScreenController extends GetxController {
  goToLoginScreen() async {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.to(() => const LoginScreen()));
  }
}
