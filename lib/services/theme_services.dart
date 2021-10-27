import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final GetStorage _box = GetStorage();
  final String key = 'darkMode';

  bool _loadThemeFromBox() => _box.read(key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  changeTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!_loadThemeFromBox());
  }

  saveThemeMode(bool isDarkMode) => _box.write(key, isDarkMode);
}
