import 'package:go_router/go_router.dart';

import '../../page/dashboard/dashboard_screen.dart';
import '../../page/main/main_page.dart';
import '../../page/add_tour/add_tour_screen.dart';
import 'routes_name.dart';

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
        child: AddTourScreen(),
      ),
    ),
    GoRoute(
      path: RoutesName.tourScreen,
      name: "tourScreen",
      builder: (context, state) => const MainPage(
        child: AddTourScreen(),
      ),
    ),
    GoRoute(
      path: RoutesName.addScreen,
      name: "addScreen",
      builder: (context, state) => const MainPage(
        child: AddTourScreen(),
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

List<String> listString = [
  'dashboardScreen',
  'addTourScreen',
  'tourScreen',
  'addScreen',
  'imageScreen',
];
