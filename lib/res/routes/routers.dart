
import 'package:bd_tour_firebase_admin/page/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/network/data_firebase_service.dart';
import '../../model/tour_model.dart';
import '../../page/dashboard/dashboard_screen.dart';
import '../../page/login/login_page.dart';
import '../../page/main/main_page.dart';
import '../../page/add_tour/add_tour_screen.dart';
import '../../page/profile/profile_screen.dart';
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
          child: DashboardScreen(
              scaffoldKey: dashboardScaffoldKey), // Pass scaffoldKey here
          scaffoldKey: dashboardScaffoldKey, // Use the same key for MainPage
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
          child: DashboardScreen(scaffoldKey: dashboardScaffoldKey),
          // Pass scaffoldKey here
          scaffoldKey: dashboardScaffoldKey, // Use the same key for MainPage
        );
      },
    ),

    GoRoute(
      path: RoutesPath.tourScreen,
      name: RoutesName.tourScreen, //"dashboardScreen",
      builder: (context, state) => MainPage(
          child: TourScreen(), scaffoldKey: GlobalKey<ScaffoldState>()),
    ),
    GoRoute(
      path: RoutesPath.userScreen,
      name: RoutesName.userScreen, //"dashboardScreen",
      builder: (context, state) => MainPage(
          child: UserScreen(), scaffoldKey: GlobalKey<ScaffoldState>()),
    ),
    GoRoute(
        path: RoutesPath.addTourScreen,
        name: RoutesName.addTourScreen,
        builder: (context, state) {
          // final GlobalKey<ScaffoldState> addScaffoldKey = ;
          final data =
              state.extra != null ? state.extra as Map<String, dynamic> : null;
          return MainPage(
              child: AddTourScreen(
                data: data,

                // scaffoldKey: GlobalKey<ScaffoldState>(),
              ),
              scaffoldKey: GlobalKey<ScaffoldState>());
        }),
    GoRoute(
        path: RoutesPath.searchScreen,
        name: RoutesName.searchScreen,
        builder: (context, state) {
          return MainPage(
               scaffoldKey: GlobalKey<ScaffoldState>(),
              child: SearchTourScreen(), );
        }),
    GoRoute(
        path: RoutesPath.guideScreen,
        name: RoutesName.guideScreen,
        builder: (context, state) {
          return MainPage(
              child: GuideScreen(), scaffoldKey: GlobalKey<ScaffoldState>());
        }),
        GoRoute(
            path: RoutesPath.profileScreen,
            name: RoutesName.profileScreen,
            builder: (context, state) {
              return MainPage(
                  child: ProfileScreen(), scaffoldKey: GlobalKey<ScaffoldState>());
            }),

    GoRoute(
      path: '/details/:id', // Dynamic path with :id
      name: RoutesName.detailsScreen,
      builder: (context, state) {
        // Get the 'id' from the path parameter
        final id = state.pathParameters['id'];

        // Pass the id to the widget
        return DetailsTourWidget(id: id!);
      },
    ),

    // GoRoute(
    //   path: RoutesPath.userScreen,
    //   name: RoutesName.userScreen,
    //   builder: (context, state) => const MainPage(
    //     child: UserScreen(),
    //   ),
    // ),
  ]);
}
