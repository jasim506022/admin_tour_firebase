import 'package:bd_tour_firebase_admin/res/apps_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


//
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

// const primaryColor = Color(0xFF2697FF);
// const secondaryColor = Color();

const cardColor = Color(0xFF2E3049);



List<DataColumn> columns = [
  const DataColumn(
    label: Text("Photo"),
  ),
  const DataColumn(
    label: Text("Tour Name"),
  ),
  const DataColumn(
    label: Text("Price"),
  ),
  const DataColumn(
    label: Text("Location"),
  ),
];
