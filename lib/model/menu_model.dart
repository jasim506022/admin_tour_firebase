import 'package:bd_tour_firebase_admin/res/routes/routes_name.dart';
import 'package:flutter/material.dart';



enum SidebarItem {
  dashboardScreen(value: 'Dashboard', iconData: Icons.dashboard, pathName: RoutesPath.dashboardScreen),
  addTourScreen(value: 'Add Tour', iconData: Icons.business, pathName: RoutesPath.addTourScreen),
  tourScreen(value: 'Tour', iconData: Icons.group, pathName: RoutesPath.tourScreen),
  searchScreen(value: 'Search', iconData: Icons.search, pathName: RoutesPath.searchScreen),
  addScreen(value: 'User', iconData: Icons.campaign,  pathName: RoutesPath.userScreen),
  imageScreen(value: 'Image', iconData: Icons.settings, pathName: RoutesPath.imageScreen),
  profileScreen(value: 'Profile', iconData: Icons.person, pathName: RoutesPath.imageScreen);

  const SidebarItem({required this.value, required this.iconData, required this.pathName});
  final String value;
  final IconData iconData;
  final String pathName;
}