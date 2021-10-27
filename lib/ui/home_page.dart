import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/services/notification_services.dart';
import 'package:todo_app/services/theme_services.dart';
import 'package:todo_app/ui/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotificationService notificationService;
  @override
  void initState() {
    super.initState();
    notificationService = NotificationService();
    notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ThemeService().changeTheme();
              notificationService.displayNotification(
                title: 'Theme changed!',
                body: Get.isDarkMode
                    ? 'Activated Light Theme'
                    : 'Activated Dark Theme',
              );
              notificationService.scheduledNotification();
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
