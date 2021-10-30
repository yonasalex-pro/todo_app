import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/services/notification_services.dart';
import 'package:todo_app/services/theme_services.dart';
import 'package:todo_app/ui/add_task_screen.dart';
import 'package:todo_app/ui/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotificationService notificationService;
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    notificationService = NotificationService();
    notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 14),
        child: Column(
          children: [
            _buildDatePicker(),
          ],
        ),
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      onPressed: () => Get.to(
        () => const AddTaskScreen(),
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 600),
      ),
      backgroundColor: blue,
      child: const Icon(Icons.post_add_outlined, color: white),
    );
  }

  DatePicker _buildDatePicker() {
    return DatePicker(
      DateTime.now(),
      height: 78,
      width: 48,
      initialSelectedDate: DateTime.now(),
      selectionColor: blue,
      selectedTextColor: white,
      dateTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
      monthTextStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
      dayTextStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
      onDateChange: (newDate) => selectedDate = newDate,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'TODAY',
            style: TextStyle(color: Get.isDarkMode ? white : darkHeader),
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: subHeadingStyle,
          ),
        ],
      ),
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
          },
          icon: Icon(
            Get.isDarkMode ? Icons.lightbulb_outline : Icons.lightbulb,
            color: yellow,
          ),
        ),
      ],
    );
  }
}
