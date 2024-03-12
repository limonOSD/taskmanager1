import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager1/app.dart';
import 'package:taskmanager1/firebase_options.dart';

void main() {
  runApp(const TaskManager());
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
