// class AuthController extends GetxController {
//   var firstNameController = TextEditingController();
//   var emailController = TextEditingController();
//   var lastNameController = TextEditingController();
//   var mobileController = TextEditingController();
//   var passwordController = TextEditingController();
//   var inProgress = false.obs;
//   UserCredential? userCredential;
//   signUp() async {
//     inProgress(true);
//     userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text, password: passwordController.text);
//     await storeUserData(userCredential!.user!.uid, firstNameController.text,
//         emailController.text, lastNameController.text, mobileController.text);
//     inProgress(false);
//   }

//   storeUserData(String uid, String firstName, String email, String lastName,
//       String mobile) async {
//     var store = FirebaseFirestore.instance.collection('users').doc(uid);
//     await store.set({
//       'firstName': firstName,
//       'email': email,
//       'lastName': lastName,
//       'mobile': mobile,
//     });
//   }

//   loginController() async {
//     inProgress(true);
//     userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(
//             email: emailController.text, password: passwordController.text)
//         .then((value) => Get.offAll(const MainBottomNavScreen()));
//     inProgress(false);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager1/presentation/ui/screens/loginscreen.dart';
import 'package:taskmanager1/presentation/ui/screens/main_bottom_nav_screen.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var inProgress = false.obs;
  UserCredential? userCredential;

  signUp() async {
    inProgress(true);
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      await storeUserData(
          userCredential!.user!.uid,
          emailController.text,
          firstNameController.text,
          lastNameController.text,
          mobileController.text);
      inProgress(false);
    } on FirebaseAuthException catch (ex) {
      inProgress(false);
      return snackbarController('Error', ex.code.toString());
    }
  }

  storeUserData(
    String uid,
    String email,
    String firstName,
    String lastName,
    String mobile,
  ) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
    });
  }

  loginController() async {
    inProgress(true);
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then(
            (value) => Get.offAll(() => const MainBottomNavScreen()),
          );
      inProgress(false);
    } on FirebaseAuthException catch (ex) {
      inProgress(false);
      return snackbarController('Error', ex.code.toString());
    }
  }

  static snackbarController(String title, String message) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.red,
        title: title,
        message: message,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  checkUser() async {
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAll(() => const MainBottomNavScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.offAll(() => const LoginScreen()));
  }
  
}
