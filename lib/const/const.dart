import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globalmethod.dart';

GlobalMethod globalMethod = GlobalMethod();

SharedPreferences? sharedPreference;

late Size mq;

List<String> travelCategories = [
  "History",
  "Museum",
  "Lake",
  "Sea",
  "River",
  "Other"
];

// List<dynamic> list = [];

enum Gender { male, female, other }

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const cardColor = Color(0xFF2E3049);

const defaultPadding = 16.0;

enum SidebarItem {
  dashboardScreen(value: 'Dashboard', iconData: Icons.dashboard),
  addTourScreen(value: 'Add Tour', iconData: Icons.business),
  tourScreen(value: 'Tour', iconData: Icons.group),
  addScreen(value: 'Add', iconData: Icons.campaign),
  imageScreen(value: 'Image', iconData: Icons.settings);

  const SidebarItem({required this.value, required this.iconData});

  final String value;
  final IconData iconData;
}
