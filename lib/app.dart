import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taskmanager1/controller_binder.dart';
import 'package:taskmanager1/presentation/ui/screens/splashscreen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      title: 'Task Manager App',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textTheme: const TextTheme(
            titleSmall: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            bodySmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ),
      initialBinding: ControllerBinder(),
    );
  }
}
