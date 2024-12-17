import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Task> tasks = [
    Task(title: "Задача #1", description: "Описание #1"),
    Task(title: "Задача #2", description: "Описание #2"),
    Task(title: "Задача #3", description: "Описание #3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Главная страница'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        actions: const [

        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Project Tracker!',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Главный экран"),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Добро пожаловать в Project Tracker!',
                style: TextStyle(fontSize: 30),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: tasks.map((task) {
                  return ListTile(
                    leading: const Icon(Icons.star),
                    title: Text(task.title),
                    subtitle: Text(task.description),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar
                            (content: Text("Вы выбрали ${task.title}"),
                            action: SnackBarAction(
                                label: "Закрыть",
                                onPressed: (){
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                }
                            ),
                            duration: const Duration(seconds: 3)
                          ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}