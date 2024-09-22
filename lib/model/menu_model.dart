import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../res/routes/routes_name.dart';

enum SidebarItem {
  dashboardScreen(
      value: 'Dashboard',
      iconData: Icons.dashboard,
      pathName: RoutesPath.dashboardScreen),
  addTourScreen(
      value: 'Add Tour',
      iconData: Icons.add_circle_outline,
      pathName: RoutesPath.addTourScreen),
  tourScreen(
      value: 'Tour', iconData: Icons.tour, pathName: RoutesPath.tourScreen),
  searchScreen(
      value: 'Search',
      iconData: Icons.search,
      pathName: RoutesPath.searchScreen),
  userScreen(
      value: 'User', iconData: Icons.people_sharp, pathName: RoutesPath.userScreen),
  guideScreen(
      value: 'Guide', iconData: Icons.people, pathName: RoutesPath.guideScreen),
  profileScreen(
      value: 'Profile',
      iconData: IconlyBold.setting,
      pathName: RoutesPath.profileScreen);

  const SidebarItem(
      {required this.value, required this.iconData, required this.pathName});

  final String value;
  final IconData iconData;
  final String pathName;
}
