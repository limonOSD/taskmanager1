import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager1/presentation/ui/screens/main_bottom_nav_screen.dart';

class AuthController extends GetxController {
  var firstNameController = TextEditingController();
  var emailController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var inProgress = false.obs;
  UserCredential? userCredential;
  signUp() async {
    inProgress(true);
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    await storeUserData(userCredential!.user!.uid, firstNameController.text,
        emailController.text, lastNameController.text, mobileController.text);
    inProgress(false);
  }

  storeUserData(String uid, String firstName, String email, String lastName,
      String mobile) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({
      'firstName': firstName,
      'email': email,
      'lastName': lastName,
      'mobile': mobile,
    });
  }

  loginController() async {
    inProgress(true);
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) => Get.offAll(const MainBottomNavScreen()));
    inProgress(false);
  }
}
