import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../page/dashboard/dashboard_screen.dart';
import '../../page/login/login_page.dart';
import '../../page/main/main_page.dart';
import '../../page/add_tour/add_tour_screen.dart';
import '../../page/profile/profile_screen.dart';
import '../../page/search/search_screen.dart';
import '../../page/tour/tour_screen.dart';
import '../../page/tour_detail/details_tour.dart';

import '../../page/users_guides/guide_screen.dart';
import '../../page/users_guides/user_screen.dart';
import 'routes_name.dart';

class Routers {
  static final GoRouter goRoute =
      GoRouter(initialLocation: RoutesName.initialRoute, routes: [
    GoRoute(
      path: RoutesPath.initialRoute,
      name: RoutesName.initialRoute,
      builder: (context, state) => const LogInPage(),
    ),
    GoRoute(
      path: RoutesPath.mainPage,
      name: RoutesName.mainPage,
      builder: (context, state) {
        final GlobalKey<ScaffoldState> dashboardScaffoldKey =
            GlobalKey<ScaffoldState>();
        return MainPage(
          scaffoldKey: dashboardScaffoldKey,
          child: DashboardScreen(
              scaffoldKey:
                  dashboardScaffoldKey), // Use the same key for MainPage
        );
      },
    ),
    GoRoute(
      path: RoutesPath.dashboardScreen,
      name: RoutesName.dashboardScreen,
      builder: (context, state) {
        final GlobalKey<ScaffoldState> dashboardScaffoldKey =
            GlobalKey<ScaffoldState>();
        return MainPage(
          scaffoldKey: dashboardScaffoldKey,
          child: DashboardScreen(
              scaffoldKey:
                  dashboardScaffoldKey), // Use the same key for MainPage
        );
      },
    ),
    GoRoute(
      path: RoutesPath.tourScreen,
      name: RoutesName.tourScreen, //"dashboardScreen",
      builder: (context, state) => MainPage(
          scaffoldKey: GlobalKey<ScaffoldState>(), child: const TourScreen()),
    ),
    GoRoute(
      path: RoutesPath.userScreen,
      name: RoutesName.userScreen, //"dashboardScreen",
      builder: (context, state) => MainPage(
          scaffoldKey: GlobalKey<ScaffoldState>(), child: const UserScreen()),
    ),
    GoRoute(
        path: RoutesPath.addTourScreen,
        name: RoutesName.addTourScreen,
        builder: (context, state) {
          // final GlobalKey<ScaffoldState> addScaffoldKey = ;
          final data =
              state.extra != null ? state.extra as Map<String, dynamic> : null;
          return MainPage(
              scaffoldKey: GlobalKey<ScaffoldState>(),
              child: AddTourScreen(
                data: data,
              ));
        }),
    GoRoute(
        path: RoutesPath.searchScreen,
        name: RoutesName.searchScreen,
        builder: (context, state) {
          return MainPage(
            scaffoldKey: GlobalKey<ScaffoldState>(),
            child: const SearchTourScreen(),
          );
        }),
    GoRoute(
        path: RoutesPath.guideScreen,
        name: RoutesName.guideScreen,
        builder: (context, state) {
          return MainPage(
              scaffoldKey: GlobalKey<ScaffoldState>(),
              child: const GuideScreen());
        }),
    GoRoute(
        path: RoutesPath.profileScreen,
        name: RoutesName.profileScreen,
        builder: (context, state) {
          return MainPage(
              scaffoldKey: GlobalKey<ScaffoldState>(),
              child: const ProfileScreen());
        }),
    GoRoute(
      path: '/details/:id', // Dynamic path with :id
      name: RoutesName.detailsScreen,
      builder: (context, state) {
        final id = state.pathParameters['id'];

        return DetailsTourWidget(id: id!);
      },
    ),
  ]);
}
