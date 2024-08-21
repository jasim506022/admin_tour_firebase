import 'package:bd_tour_firebase_admin/const/dashboard_screen.dart';
import 'package:bd_tour_firebase_admin/page/mainpage.dart';
import 'package:bd_tour_firebase_admin/res/routes/routes_name.dart';
import 'package:bd_tour_firebase_admin/widget/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static final GoRouter goRoute =
      GoRouter(initialLocation: RoutesName.mainPage, routes: [
    GoRoute(
      path: RoutesName.mainPage,
      name: "mainPage",
      builder: (context, state) => const MainPage(
        child: DashboardScreen(),
      ),
    ),
    GoRoute(
      path: RoutesName.dashboardScreen,
      name: "dashboardScreen",
      builder: (context, state) => const MainPage(
        child: DashboardScreen(),
      ),
    ),
    GoRoute(
      path: RoutesName.addTourScreen,
      name: "addTourScreen",
      builder: (context, state) => const MainPage(
        child: DashboardWidget(),
      ),
    ),
    GoRoute(
      path: RoutesName.tourScreen,
      name: "tourScreen",
      builder: (context, state) => const MainPage(
        child: DashboardWidget(),
      ),
    ),
    GoRoute(
      path: RoutesName.addScreen,
      name: "addScreen",
      builder: (context, state) => const MainPage(
        child: DashboardWidget(),
      ),
    ),
    GoRoute(
      path: RoutesName.imageScreen,
      name: "imageScreen",
      builder: (context, state) => const MainPage(
        child: DashboardScreen(),
      ),
    ),
  ]);
}

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

List<String> listString = [
  'dashboardScreen',
  'addTourScreen',
  'tourScreen',
  'addScreen',
  'imageScreen',
];
