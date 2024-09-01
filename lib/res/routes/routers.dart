import 'package:bd_tour_firebase_admin/page/login/login_page.dart';
import 'package:bd_tour_firebase_admin/page/tour/tour_screen.dart';
import 'package:bd_tour_firebase_admin/page/users/userscreen.dart';
import 'package:go_router/go_router.dart';

import '../../page/dashboard/dashboard_screen.dart';
import '../../page/main/main_page.dart';
import '../../page/add_tour/add_tour_screen.dart';
import 'routes_name.dart';

class Routers {
  static final GoRouter goRoute =
      GoRouter(initialLocation: RoutesName.initialRoute, routes: [
    GoRoute(
      path: RoutesName.initialRoute,
      name: RoutesName.initialRoute,
      builder: (context, state) => const LogInPage(
          // child: UserScreen(),
          ),
    ),
        GoRoute(
          path: RoutesName.mainPage,
          name: RoutesName.mainPage,
          builder: (context, state) => const MainPage(
            child: DashboardScreen(),
          ),
        ),
    GoRoute(
      path: RoutesName.dashboardScreen,
      name: RoutesName.dashboardScreen,
      builder: (context, state) => const MainPage(
        child: DashboardScreen(),
      ),
    ),
    GoRoute(
      path: RoutesName.userScreen,
      name: "userScreen", //"dashboardScreen",
      builder: (context, state) => const MainPage(
        child: UserScreen(),
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
        builder: (context, state) {
          return const MainPage(
            child: TourScreen(),
          );
        }),
    GoRoute(
        path: RoutesName.addScreen,
        name: "addScreen",
        builder: (context, state) {
          final data =
              state.extra != null ? state.extra as Map<String, dynamic> : null;
          return MainPage(
            child: AddTourScreen(data: data),
          );
        }),
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
