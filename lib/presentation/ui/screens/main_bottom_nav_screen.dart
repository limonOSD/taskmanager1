import 'package:flutter/material.dart';
import 'package:taskmanager1/presentation/ui/screens/canceled_task_screen.dart';
import 'package:taskmanager1/presentation/ui/screens/completed_task_screen.dart';
import 'package:taskmanager1/presentation/ui/screens/inprogress_task_screen.dart';
import 'package:taskmanager1/presentation/ui/screens/new_task_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int selctedIndex = 0;
  final screen = [
    const NewTaskScreen(),
    const InProgressScreen(),
    const CompletedTaskScreen(),
    const CancelledTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selctedIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value) {
            setState(() {
              selctedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.task), label: 'New'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'InProgress'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.close), label: 'Cancelled'),
          ],
        ),
        body: screen[selctedIndex]);
  }
}
