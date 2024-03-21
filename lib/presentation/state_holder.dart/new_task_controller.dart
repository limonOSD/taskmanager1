import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTaskController extends GetxController {
  Future<Stream<QuerySnapshot>> getNewTask() async {
    return await FirebaseFirestore.instance.collection('task').snapshots();
  }

  Future updateTask(String id, Map<String, dynamic> updateTasksInfo) async {
    return await FirebaseFirestore.instance
        .collection('task')
        .doc(id)
        .update(updateTasksInfo)
        .then((value) => Get.back());
  }

  Future deleteTask(String id) async {
    return await FirebaseFirestore.instance
        .collection('task')
        .doc(id)
        .delete()
        .then(
          (value) => Get.showSnackbar(
            const GetSnackBar(
              backgroundColor: Colors.red,
              title: 'Delete',
              message: 'Task Delete Successful',
              duration: Duration(seconds: 2),
              isDismissible: true,
            ),
          ),
        );
  }
}
