import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager1/presentation/state_holder.dart/auth_controller.dart';
import 'package:taskmanager1/presentation/ui/screens/signup_screen.dart';

import 'package:taskmanager1/presentation/ui/widget/body_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackGround(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get started with',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
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
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
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
                                    if (_formKey.currentState!.validate()) {
                                      controller.loginController();
                                      clearData();
                                    }
                                  },
                                  child: const Icon(
                                      Icons.arrow_circle_right_outlined),
                                ),
                        )),
                    const SizedBox(
                      height: 35,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            // Get.to(() => const VerifyEmailScreen());
                          },
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '''Don't have an account?''',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const SignUpScreen());
                          },
                          child: const Text(
                            'Sign UP',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        )
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
    controller.passwordController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    controller.emailController.dispose();
    controller.passwordController.dispose();
  }
}
