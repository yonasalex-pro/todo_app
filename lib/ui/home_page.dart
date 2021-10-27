import 'package:flutter/material.dart';
import 'package:todo_app/services/theme_services.dart';
import 'package:todo_app/ui/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ThemeService().changeTheme();
            },
            icon: const Icon(
              Icons.lightbulb,
              color: darkHeader,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Testing'),
      ),
    );
  }
}
