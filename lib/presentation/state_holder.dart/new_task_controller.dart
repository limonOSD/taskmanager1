import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NewTaskController extends GetxController {
  Stream? task;

  Future<Stream<QuerySnapshot>> getNewTask() async {
    return await FirebaseFirestore.instance.collection('task').snapshots();
  }
}
