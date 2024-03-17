import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager1/presentation/state_holder.dart/new_task_controller.dart';
import 'package:taskmanager1/presentation/ui/screens/add_new_task.dart';
import 'package:taskmanager1/presentation/ui/widget/profile_summary_card.dart';
import 'package:taskmanager1/presentation/ui/widget/summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  Stream? taskStrem;

  getontheload() async {
    taskStrem = await controller.getNewTask();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  final controller = Get.put(NewTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Get.to(() => const AddNewTaskScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const FittedBox(child: SummaryCard());
                },
              ),
            ),
            StreamBuilder(
                stream: taskStrem,
                builder: (context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot ds = snapshot.data.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 6),
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ds['subject'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          Text(
                                            ds['description'],
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            'Date:12-08-2001',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade500),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Chip(
                                                  label: Text(
                                                    'New',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      Colors.purple,
                                                ),
                                              ),
                                              Wrap(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.edit,
                                                        color: Colors.purple,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : const Center(
                          child: Text('data not available'),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
