import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager1/presentation/state_holder.dart/auth_controller.dart';
import 'package:taskmanager1/presentation/ui/screens/profile_update_screen.dart';

class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({
    super.key,
  });

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {
  bool isDark = false;
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const UpdateProfileScreen());
      },
      child: Container(
        height: 60,
        width: double.infinity,
        color: Colors.purple,
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 8, right: 5),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.person),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Limon Paul Argo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'limonpaulargo47@gmail.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
              onPressed: () {
                controller.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
