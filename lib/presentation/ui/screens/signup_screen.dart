import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager1/presentation/state_holder.dart/auth_controller.dart';
import 'package:taskmanager1/presentation/ui/screens/loginscreen.dart';

import 'package:taskmanager1/presentation/ui/widget/body_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackGround(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join With Us',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.firstNameController,
                      decoration: const InputDecoration(hintText: 'First Name'),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.lastNameController,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
                      ),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your mobile';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(
                        () => controller.inProgress.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    await controller.signUp();
                                    clearData();

                                    if (controller.userCredential != null) {
                                      Get.showSnackbar(const GetSnackBar(
                                        title: 'Success',
                                        message:
                                            'Account Created. Plese login!',
                                        duration: Duration(seconds: 2),
                                        isDismissible: true,
                                      ));
                                    } else {
                                      Get.showSnackbar(const GetSnackBar(
                                        backgroundColor: Colors.red,
                                        title: 'Failed',
                                        message: 'Something went wrong',
                                        duration: Duration(seconds: 2),
                                        isDismissible: true,
                                      ));
                                    }
                                  }
                                },
                                child: const Icon(
                                    Icons.arrow_circle_right_outlined),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account?',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(() => const LoginScreen());
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  clearData() {
    controller.emailController.clear();
    controller.firstNameController.clear();
    controller.lastNameController.clear();
    controller.mobileController.clear();
    controller.passwordController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    controller.emailController.dispose();
    controller.firstNameController.dispose();
    controller.lastNameController.dispose();
    controller.mobileController.dispose();
    controller.passwordController.dispose();
  }
}
