import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../const/const.dart';

class SummerModel {
  final String title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;
  final IconData icon;

  SummerModel({
    required this.icon,
    required this.title,
    required this.totalStorage,
    required this.numOfFiles,
    required this.percentage,
    required this.color,
  });
}

List summerList = [
  SummerModel(
    title: "Total Tour",
    numOfFiles: 1328,
    icon: Icons.tour,
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  SummerModel(
    title: "Total User",
    numOfFiles: 1328,
    icon: Icons.person,
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  SummerModel(
    title: "Guide",
    numOfFiles: 1328,
    icon: IconlyLight.user2,
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  SummerModel(
    title: "Others",
    numOfFiles: 5328,
    icon: Icons.person,
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
];
