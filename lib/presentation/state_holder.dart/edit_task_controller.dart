import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:taskmanager1/presentation/ui/screens/new_task_screen.dart';

class EditTaskController extends GetxController {
  Future updateTask(String id, Map<String, dynamic> updateTasksInfo) async {
    return await FirebaseFirestore.instance
        .collection('Task')
        .doc(id)
        .update(updateTasksInfo)
        .then((value) => Get.to(() => const NewTaskScreen()));
  }
}
