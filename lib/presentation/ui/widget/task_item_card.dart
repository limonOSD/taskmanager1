import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Text(
              'Desciption',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            Text(
              'Date:12-08-2001',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Chip(
                    label: Text(
                      'New',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: Colors.purple,
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
    );
  }
}
