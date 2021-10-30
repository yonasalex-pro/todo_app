import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/ui/themes.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
