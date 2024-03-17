import 'package:flutter/material.dart';
import 'package:taskmanager1/data/model/ui_helper.dart';
import 'package:taskmanager1/presentation/ui/widget/body_background.dart';
import 'package:taskmanager1/presentation/ui/widget/profile_summary_card.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
                    padding:
                        const EdgeInsets.only(top: 120, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Update Profile',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 30,
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                      color: Colors.grey),
                                  child: const Center(
                                      child: Text(
                                    'Photo',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )),
                            Expanded(
                                flex: 70,
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      color: Colors.white),
                                  child: const Center(child: Text('No entry')),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              const InputDecoration(hintText: 'Subject'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              const InputDecoration(hintText: 'First Name'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              const InputDecoration(hintText: 'Last Name'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(hintText: 'Mobile'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        UiHelper.customButton(() {}, 'Update'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
