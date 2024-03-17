import 'package:flutter/material.dart';
import 'package:taskmanager1/presentation/ui/widget/profile_summary_card.dart';
import 'package:taskmanager1/presentation/ui/widget/task_item_card.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const ProfileSummaryCard(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                    child: TaskItemCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
