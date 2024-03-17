import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddNewTaskController extends GetxController {
  Future addNewTaskDetails(Map<String, dynamic> taskInfo, String id) async {
    await FirebaseFirestore.instance.collection('task').doc(id).set(taskInfo);
  }
  
}
