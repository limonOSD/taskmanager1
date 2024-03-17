import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:taskmanager1/data/model/ui_helper.dart';
import 'package:taskmanager1/presentation/state_holder.dart/add_new_task_controller.dart';
import 'package:taskmanager1/presentation/ui/widget/body_background.dart';
import 'package:taskmanager1/presentation/ui/widget/profile_summary_card.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectTEController = TextEditingController();
  final TextEditingController _descriptionTEContorller =
      TextEditingController();
  final conroller = Get.put(AddNewTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            Expanded(
              child: BodyBackGround(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 120, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add New Task',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            TextFormField(
                              controller: _subjectTEController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration:
                                  const InputDecoration(hintText: 'Subject'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _descriptionTEContorller,
                              maxLines: 5,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                              ),
                            ),
                            UiHelper.customButton(() async {
                              String id = randomAlphaNumeric(10);
                              Map<String, dynamic> taskInfo = {
                                'Id': id,
                                'subject': _subjectTEController.text,
                                'description': _descriptionTEContorller.text,
                              };
                              await conroller
                                  .addNewTaskDetails(taskInfo, id)
                                  .then(
                                    (value) => Get.showSnackbar(
                                      const GetSnackBar(
                                        title: 'Upload',
                                        message: 'Data uploded successfully',
                                        duration: Duration(seconds: 2),
                                        isDismissible: true,
                                      ),
                                    ),
                                  );
                              clearTaskData();
                            }, 'Add'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  clearTaskData() {
    _subjectTEController.clear();
    _descriptionTEContorller.clear();
  }

  @override
  void dispose() {
    _subjectTEController.dispose();
    _descriptionTEContorller.dispose();
    super.dispose();
  }
}
