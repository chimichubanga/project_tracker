import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  final String projectName;
  final String projectDescription;

  const ProjectScreen({super.key, required this.projectName, required this.projectDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              projectName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              projectDescription,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text('Список задач будет тут'),
          ],
        ),
      ),
    );
  }
}