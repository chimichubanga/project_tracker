import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;

  const HomeScreen({super.key, required this.toggleTheme, required this.themeMode});

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light
                  ? Icons.nightlight_round
                  : Icons.wb_sunny,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
        drawer: Drawer(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'Милан Иванченко',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  accountEmail: Text(
                    '123@email.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile_pic.jpeg'),
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.blueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Theme.of(context).iconTheme.color),
                  title: Text(
                    'Главный экран',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    _scaffoldKey.currentState?.closeDrawer();
                    // Логика перехода
                  },
                ),
                ListTile(
                  leading: Icon(Icons.list, color: Theme.of(context).iconTheme.color),
                  title: Text(
                    'Проекты',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    _scaffoldKey.currentState?.closeDrawer();
                    // Логика перехода
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.settings, color: Theme.of(context).iconTheme.color),
                  title: Text(
                    'Настройки',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    _scaffoldKey.currentState?.closeDrawer();
                    // Логика перехода
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Theme.of(context).iconTheme.color),
                  title: Text(
                    'Выход',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    // Логика выхода
                  },
                ),
              ],
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Добро пожаловать в Project Tracker!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {

              },
              child: const Text(
                'Создать проект',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {

              },
              child: const Text(
                'Присоединиться к проекту',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}