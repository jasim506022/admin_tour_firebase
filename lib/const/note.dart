import 'dart:math';




















import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/*

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: _goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 80,
          backgroundColor: Color(0xffEEEEEE),
        ),
      ),
    );
  }
}

final GoRouter _goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'dashboard',
      builder: (context, state) => const ScaffoldWithSideBar(child: DashboardScreen()),
    ),
    GoRoute(
      path: '/units',
      name: 'units',
      builder: (context, state) => const ScaffoldWithSideBar(child: UnitsScreen()),
    ),
    GoRoute(
      path: '/tenants',
      name: 'tenants',
      builder: (context, state) => const ScaffoldWithSideBar(child: TenantsScreen()),
    ),
    GoRoute(
      path: '/notices',
      name: 'notices',
      builder: (context, state) => const ScaffoldWithSideBar(child: NoticesScreen()),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const ScaffoldWithSideBar(child: SettingsScreen()),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

enum SidebarItem {
  dashboard(value: 'Dashboard', iconData: Icons.dashboard),
  units(value: 'Units', iconData: Icons.business),
  tenants(value: 'Tenants', iconData: Icons.group),
  notices(value: 'Notices', iconData: Icons.campaign),
  settings(value: 'Settings', iconData: Icons.settings);

  const SidebarItem({required this.value, required this.iconData});

  final String value;
  final IconData iconData;
}

class ScaffoldWithSideBar extends StatefulWidget {
  const ScaffoldWithSideBar({super.key, required this.child});

  final Widget child;

  @override
  _ScaffoldWithSideBarState createState() => _ScaffoldWithSideBarState();
}

class _ScaffoldWithSideBarState extends State<ScaffoldWithSideBar> {
  String selectedRoute = SidebarItem.dashboard.name;

  SidebarItem getSideBarItem(AdminMenuItem item) {
    for (var value in SidebarItem.values) {
      if (item.route == value.name) {
        return value;
      }
    }
    return SidebarItem.dashboard;
  }

  @override
  Widget build(BuildContext context) {
    final sideBarkey = ValueKey(UniqueKey());

    return AdminScaffold(
      appBar: AppBar(title: const Text('Admin Panel with GoRouter Demo')),
      body: widget.child,
      sideBar: SideBar(
        key: sideBarkey,
        activeBackgroundColor: Colors.white,
        onSelected: (item) {
          setState(() {
            selectedRoute = item.route ?? '';
          });
          context.goNamed(item.route ?? '');
        },
        items: SidebarItem.values
            .map((e) => AdminMenuItem(
            title: e.value, icon: e.iconData, route: e.name))
            .toList(),
        selectedRoute: selectedRoute,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Dashboard Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Units Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class TenantsScreen extends StatelessWidget {
  const TenantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tenants Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notices Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          context.goNamed("profile");
        },
        child: const Text(
          'Settings Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}



 */

/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: _goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 80,
          backgroundColor: Color(0xffEEEEEE),
        ),
      ),
    );
  }
}

final GoRouter _goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'dashboard',
      builder: (context, state) => const ScaffoldWithSideBar(child: DashboardScreen()),
    ),
    GoRoute(
      path: '/units',
      name: 'units',
      builder: (context, state) => const ScaffoldWithSideBar(child: UnitsScreen()),
    ),
    GoRoute(
      path: '/tenants',
      name: 'tenants',
      builder: (context, state) => const ScaffoldWithSideBar(child: TenantsScreen()),
    ),
    GoRoute(
      path: '/notices',
      name: 'notices',
      builder: (context, state) => const ScaffoldWithSideBar(child: NoticesScreen()),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const ScaffoldWithSideBar(child: SettingsScreen()),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

enum SidebarItem {
  dashboard(value: 'Dashboard', iconData: Icons.dashboard),
  units(value: 'Units', iconData: Icons.business),
  tenants(value: 'Tenants', iconData: Icons.group),
  notices(value: 'Notices', iconData: Icons.campaign),
  settings(value: 'Settings', iconData: Icons.settings);

  const SidebarItem({required this.value, required this.iconData});

  final String value;
  final IconData iconData;
}

class ScaffoldWithSideBar extends StatefulWidget {
  const ScaffoldWithSideBar({super.key, required this.child});

  final Widget child;

  @override
  _ScaffoldWithSideBarState createState() => _ScaffoldWithSideBarState();
}

class _ScaffoldWithSideBarState extends State<ScaffoldWithSideBar> {
  String selectedRoute = SidebarItem.dashboard.name;

  SidebarItem getSideBarItem(AdminMenuItem item) {
    for (var value in SidebarItem.values) {
      if (item.route == value.name) {
        return value;
      }
    }
    return SidebarItem.dashboard;
  }

  @override
  Widget build(BuildContext context) {
    final sideBarkey = ValueKey(UniqueKey());

    return AdminScaffold(
      appBar: AppBar(title: const Text('Admin Panel with GoRouter Demo')),
      body: widget.child,
      sideBar: SideBar(
        key: sideBarkey,
        activeBackgroundColor: Colors.white,
        onSelected: (item) {
          setState(() {
            selectedRoute = item.route ?? '';
          });
          context.goNamed(item.route ?? '');
        },
        items: SidebarItem.values
            .map((e) => AdminMenuItem(
            title: e.value, icon: e.iconData, route: e.name))
            .toList(),
        selectedRoute: selectedRoute,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Dashboard Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Units Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class TenantsScreen extends StatelessWidget {
  const TenantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tenants Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notices Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          context.goNamed("profile");
        },
        child: const Text(
          'Settings Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}


 */

//
// void main() {
//   setUrlStrategy(PathUrlStrategy());
//   runApp(const ProviderScope(child: AppWithGoRouter()));
// }
//
// class AppWithGoRouter extends ConsumerWidget {
//   const AppWithGoRouter({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final goRouter = ref.watch(goRouterProvider);
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       routerConfig: goRouter,
//       theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//           appBarTheme: const AppBarTheme(
//             toolbarHeight: 80,
//             backgroundColor: Color(0xffEEEEEE),
//           )),
//     );
//   }
// }
//
// final goRouterProvider = Provider<GoRouter>((ref) {
//   return GoRouter(initialLocation: '/', routes: [
//     StatefulShellRoute.indexedStack(
//       builder: (BuildContext context, GoRouterState state,
//           StatefulNavigationShell navigationShell) {
//         return ScaffoldWithSideBar(navigationShell: navigationShell);
//       },
//       branches: [
//         StatefulShellBranch(routes: [
//           GoRoute(
//               name: 'root',
//               path: '/',
//               pageBuilder: (context, state) {
//                 return const MaterialPage(child: DashboardScreen());
//               }),
//         ]),
//         StatefulShellBranch(routes: [
//           GoRoute(
//               name: 'units',
//               path: '/units',
//               pageBuilder: (context, state) {
//                 return const MaterialPage(child: UnitsScreen());
//               }),
//         ]),
//         StatefulShellBranch(routes: [
//           GoRoute(
//               name: 'tenants',
//               path: '/tenants',
//               pageBuilder: (context, state) {
//                 return const MaterialPage(child: TenantsScreen());
//               }),
//         ]),
//         StatefulShellBranch(routes: [
//           GoRoute(
//               name: 'notices',
//               path: '/notices',
//               pageBuilder: (context, state) {
//                 return const MaterialPage(child: NoticesScreen());
//               }),
//         ]),
//         StatefulShellBranch(routes: [
//           GoRoute(
//               name: 'settings',
//               path: '/settings',
//               pageBuilder: (context, state) {
//                 return const MaterialPage(child: SettingsScreen());
//               }),
//         ]),
//       ],
//     ),
//     GoRoute(
//         path: "/profile",
//         name: "profile",
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: ProfileScreen());
//         }),
//   ]);
// });
//
// enum SidebarItem {
//   dashboard(value: 'Dashboard', iconData: Icons.dashboard),
//   units(value: 'Units', iconData: Icons.business),
//   tenants(value: 'Tenats', iconData: Icons.group),
//   notices(value: 'Notices', iconData: Icons.campaign),
//   settings(value: 'Settings', iconData: Icons.settings);
//
//   const SidebarItem({required this.value, required this.iconData});
//
//   final String value;
//   final IconData iconData;
// }
//
// final selectedRouteProvider = StateProvider<String>((ref) {
//   return SidebarItem.dashboard.name;
// });
//
// class ScaffoldWithSideBar extends ConsumerWidget {
//   const ScaffoldWithSideBar({super.key, required this.navigationShell});
//
//   final StatefulNavigationShell navigationShell;
//
//   SidebarItem getSideBarItem(AdminMenuItem item) {
//     for (var value in SidebarItem.values) {
//       if (item.route == value.name) {
//         return value;
//       }
//     }
//     return SidebarItem.dashboard;
//   }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedRoute = ref.watch(selectedRouteProvider);
//     final sideBarkey = ValueKey(Random().nextInt(1000000));
//     return AdminScaffold(
//       appBar: AppBar(title: const Text('Admin Panel with GoRouter Demo')),
//       body: navigationShell,
//       sideBar: SideBar(
//           key: sideBarkey,
//           activeBackgroundColor: Colors.white,
//           onSelected: (item) {
//             final index = getSideBarItem(item).index;
//             ref
//                 .read(selectedRouteProvider.notifier)
//                 .update((state) => item.route ?? '');
//
//             navigationShell.goBranch(
//               index,
//               // A common pattern when using bottom navigation bars is to support
//               // navigating to the initial location when tapping the item that is
//               // already active. This example demonstrates how to support this behavior,
//               // using the initialLocation parameter of goBranch.
//               initialLocation: index == navigationShell.currentIndex,
//             );
//           },
//           items: SidebarItem.values
//               .map((e) => AdminMenuItem(
//                   title: e.value, icon: e.iconData, route: e.name))
//               .toList(),
//           selectedRoute: selectedRoute),
//     );
//   }
// }
//
// enum SideBarItem {
//   dashboard(
//       value: 'Dashboard', iconData: Icons.dashboard, body: DashboardScreen()),
//   units(value: 'Units', iconData: Icons.business, body: UnitsScreen()),
//   tenants(value: 'Tenats', iconData: Icons.group, body: TenantsScreen()),
//   notices(value: 'Notices', iconData: Icons.campaign, body: NoticesScreen()),
//   settings(value: 'Settings', iconData: Icons.settings, body: SettingsScreen());
//
//   const SideBarItem(
//       {required this.value, required this.iconData, required this.body});
//
//   final String value;
//   final IconData iconData;
//   final Widget body;
// }
//
// final sideBarItemProvider =
//     StateProvider<SideBarItem>((ref) => SideBarItem.dashboard);
//
// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});
//
//   SideBarItem getSideBarItem(AdminMenuItem item) {
//     for (var value in SideBarItem.values) {
//       if (item.route == value.name) {
//         return value;
//       }
//     }
//     return SideBarItem.dashboard;
//   }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final sideBarItem = ref.watch(sideBarItemProvider);
//     final sideBarkey = ValueKey(Random().nextInt(1000000));
//     const String stringParam = 'String parameter';
//     const int intParam = 1000000;
//     return AdminScaffold(
//         appBar: AppBar(title: const Text('Admin Panel Demo')),
//         sideBar: SideBar(
//             key: sideBarkey,
//             activeBackgroundColor: Colors.white,
//             onSelected: (item) => ref
//                 .read(sideBarItemProvider.notifier)
//                 .update((state) => getSideBarItem(item)),
//             items: SideBarItem.values
//                 .map((e) => AdminMenuItem(
//                     title: e.value, icon: e.iconData, route: e.name))
//                 .toList(),
//             selectedRoute: sideBarItem.name),
//         body: ProviderScope(overrides: [
//           paramProvider.overrideWithValue((stringParam, intParam))
//         ], child: sideBarItem.body));
//   }
// }
//
// final paramProvider = Provider<(String, int)>((ref) {
//   throw UnimplementedError();
// });
//
// class DashboardScreen extends ConsumerWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final param = ref.watch(paramProvider);
//     return const Center(
//         child: Text(
//       'Dashboard Screen',
//       style: TextStyle(fontSize: 24),
//     ));
//   }
// }
//
// class UnitsScreen extends ConsumerWidget {
//   const UnitsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final param = ref.watch(paramProvider);
//     return const Center(
//         child: Text(
//       'Units Screen',
//       style: TextStyle(fontSize: 24),
//     ));
//   }
// }
//
// class TenantsScreen extends StatelessWidget {
//   const TenantsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//         child: Text(
//       'Tenants Screen',
//       style: TextStyle(fontSize: 24),
//     ));
//   }
// }
//
// class NoticesScreen extends StatelessWidget {
//   const NoticesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//         child: Text(
//       'Notices Screen',
//       style: TextStyle(fontSize: 24),
//     ));
//   }
// }
//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: TextButton(
//             onPressed: () {
//               context.go("profile");
//               // context.goNamed("",pathParameters: {"name":"Vaibhav"});
//
//             },
//             child: Text(
//               'Settings Screen',
//               style: TextStyle(fontSize: 24),
//             )));
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//         child: Text(
//       'Settings Screen',
//       style: TextStyle(fontSize: 24),
//     ));
//   }
// }



// import 'package:bd_tour_firebase_admin/page/mainpage/main_page.dart';
import 'package:bd_tour_firebase_admin/page/tours.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
/*
import 'const/const.dart';
import 'firebase_options.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';



Future<void> main() async {
  // setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  // This widget is the root of your application.
  final routerDelegate = BeamerDelegate(
    transitionDelegate: NoAnimationTransitionDelegate(),
    locationBuilder: RoutesLocationBuilder(
        routes: {
          "*": (context, state, data) => LoadingScreen()
        }
    ),

  );



  @override
  Widget build(BuildContext context) {

    mq = MediaQuery.of(context).size;


    return MaterialApp.router(
      routerDelegate: routerDelegate,
      title: 'Routes Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
    /*
      MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );

       */
/*
      GetMaterialApp.router(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      routerDelegate: AppRouterDelegate(),
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme:  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor
      ),

      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home:  const MainPage(),
    );

 */
  }
}



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  final _beamKey = GlobalKey<BeamerState>();
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: SideNav(beamer: _beamKey,),
      ),
      Expanded(child: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Beamer(
            key: _beamKey,
            routerDelegate: BeamerDelegate(locationBuilder: RoutesLocationBuilder(
                routes: {
                  "*":(context, state, data) => SizedBox(),
                  "/setting": (context, state, data){
                    print(state.pathPatternSegments);
                    if(state.pathPatternSegments.contains("account")){
                      return BeamPage(
                          key: ValueKey("AccountSettings -${DateTime.now}"),
                          type: BeamPageType.slideLeftTransition,
                          child: AccountSetting());
                    }
                    else if(state.pathPatternSegments.contains("profile")){
                      return BeamPage(
                          key: ValueKey("ProfileSettings -${DateTime.now}"),
                          type: BeamPageType.slideLeftTransition,
                          child: ProfileSetting());
                    }
                    return BeamPage(
                        key: ValueKey("Settings -${DateTime.now}"),
                        type: BeamPageType.slideLeftTransition,
                        child: Settings());
                  },
                  "/dashboard": (context, state, data) => BeamPage(
                      key: ValueKey("Dashboard"),
                      type: BeamPageType.scaleTransition,
                      child: DashBoard()),
                  "/profile": (context, state, data) => BeamPage(
                      key: ValueKey("Profile"),
                      type: BeamPageType.scaleTransition,
                      child: Profile()),
                  "/notifications": (context, state, data) => BeamPage(
                      key: ValueKey("Notifications"),
                      type: BeamPageType.scaleTransition,
                      child: Notification()),
                  "/about": (context, state, data) => BeamPage(
                      key: ValueKey("About"),
                      type: BeamPageType.scaleTransition,
                      child: About()),


                }
            ).call) ),
      ),
      )
    ],);
  }
}
class SideNav extends StatefulWidget {
  const SideNav({super.key, required this.beamer});
  final GlobalKey<BeamerState> beamer;

  @override
  State<SideNav> createState() => _SideNavState();
}
class _SideNavState extends State<SideNav> {

  int select = -1;

  List<String> navItems = [
    "Dashboard", "Setting","Profile", "Notifications", "About"
  ];
  List<String> nav = [
    "/dashboard", "/setting","/profile", "/notifications", "/about"
  ];

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    print("Path $path");
    if(path.contains("/dashboard")){
      select = 0;
    }
    else if (path.contains("/setting")){
      select =1;
    }
    else if (path.contains("/profile")){
      select =2;
    }
    else if (path.contains("/notifications")){
      select =3;
    }
    else if (path.contains("/about")){
      select =4;
    }
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:



          navItems.map((navItem) {
            return AnimatedContainer(
              key: ValueKey(navItem),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: select == navItems.indexOf(navItem)? Colors.grey[850]:Colors.white
              ),
              duration: Duration(
                  milliseconds: 375
              ),
              width: 120.0,
              child: Material(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate.beamToNamed("/example", data: "Bangladesh");
                      print("Bangladesh");
                    });
                  },
                  child: Padding(padding: EdgeInsets.all(10),

                    child: Text(navItem),
                  ),
                ),
              ),
            );
          },).toList()

      ),
    );
  }
}
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text("About", style: TextStyle(
            fontSize: 30, color: Colors.white, letterSpacing: 1
        ),),
      ),
    );
  }
}
class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("DashBoard", style: TextStyle(
            fontSize: 30, color: Colors.white, letterSpacing: 1
        ),),
      ),
    );
  }
}
class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    // final beamState = context.currentBeamLocation.state as BeamState;


    final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;
    final bookId = beamState.pathParameters['bookId'];
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text("Notification ${bookId}", style: TextStyle(
            fontSize: 30, color: Colors.white, letterSpacing: 1
        ),),
      ),
    );
  }
}
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text("Profile", style: TextStyle(
            fontSize: 30, color: Colors.white, letterSpacing: 1
        ),),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Text("Profile", style: TextStyle(
              fontSize: 30, color: Colors.white, letterSpacing: 1
          ),),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Text("Profile", style: TextStyle(
              fontSize: 30, color: Colors.white, letterSpacing: 1
          ),),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}
class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Text("Profile", style: TextStyle(
              fontSize: 30, color: Colors.white, letterSpacing: 1
          ),),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}



class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;
    // final bookId = beamState.d;
    // print("${bookId} BAngladesh");
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Text("Profiles", style: TextStyle(
              fontSize: 30, color: Colors.white, letterSpacing: 1
          ),),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}






/*
class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.HOME)!.currentPage!],
    );
  }
}



class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

*/




class Screen2Section1 extends StatelessWidget {
  const Screen2Section1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Screen 2 Section 1"),
      ),
    );
  }
}



class Screen2Section2 extends StatelessWidget {
  const Screen2Section2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Screen 2 Section 2"),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Initial Screen"),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:go_router_video/routes/route_names.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("SCREEN 1"),
          FloatingActionButton(onPressed: () {

            // context.goNamed(RouteNames.screen3,pathParameters: {"name":"Vaibhav"});
          }),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Screen 2"),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  final String name;
  const Screen3({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Screen 2"),
            Text(name),
          ],
        ),
      ),
    );
  }
}
/*

class RouteConfig {
  static GoRouter returnRouter() {
    return GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
              path: "/",
              name: RouteNames.initial,
              pageBuilder: (context, state) {
                return const MaterialPage(child: Screen1());
              }),
          GoRoute(
              path: "/screen1",
              name: RouteNames.screen1,
              pageBuilder: (context, state) {
                return const MaterialPage(child: InitialScreen());
              }),
          GoRoute(
              path: "/screen2",
              name: RouteNames.screen2,
              pageBuilder: (context, state) {
                return const MaterialPage(child: Screen2());
              },
              routes: [
                GoRoute(
                    path: "section1",
                    name: RouteNames.screen2Section1,
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: Screen2Section1());
                    }),
                GoRoute(
                    path: "section2",
                    name: RouteNames.screen2Section2,
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: Screen2Section2());
                    }),
              ]),
          GoRoute(
              path: "/screen3/:name",
              name: RouteNames.screen3,
              pageBuilder: (context, state) {
                final name = state.pathParameters["name"];
                return MaterialPage(
                    child: Screen3(
                      name: name!,
                    ));
              })
        ],
        errorPageBuilder: (context, state) {
          return const MaterialPage(child: ErrorScreen());
        });
  }
}

class RouteNames {
  static const String initial = "screen1"; //screen1
  static const String screen1 = "initial";
  static const String screen2 = "screen2";
  static const String screen3 = "screen3";

  static const String screen2Section1 = "section1";
  static const String screen2Section2 = "section2";


}


 */



 */