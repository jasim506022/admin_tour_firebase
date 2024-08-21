// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
//
// // Define route names as constants
// const String dashboardRoute = '/';
// const String unitsRoute = '/units';
// const String tenantsRoute = '/tenants';
// const String noticesRoute = '/notices';
// const String settingsRoute = '/settings';
// const String profileRoute = '/profile';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       routerDelegate: _goRouter.routerDelegate,
//       routeInformationParser: _goRouter.routeInformationParser,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//         appBarTheme: const AppBarTheme(
//           toolbarHeight: 80,
//           backgroundColor: Color(0xffEEEEEE),
//         ),
//       ),
//     );
//   }
// }
//
// final GoRouter _goRouter = GoRouter(
//   initialLocation: dashboardRoute,
//   routes: [
//     GoRoute(
//       path: dashboardRoute,
//       name: 'dashboard',
//       builder: (context, state) =>
//       const ScaffoldWithSidebar(child: DashboardScreen()),
//     ),
//     GoRoute(
//       path: unitsRoute,
//       name: 'units',
//       builder: (context, state) =>
//       const ScaffoldWithSidebar(child: UnitsScreen()),
//     ),
//     GoRoute(
//       path: tenantsRoute,
//       name: 'tenants',
//       builder: (context, state) =>
//       const ScaffoldWithSidebar(child: TenantsScreen()),
//     ),
//     GoRoute(
//       path: noticesRoute,
//       name: 'notices',
//       builder: (context, state) =>
//       const ScaffoldWithSidebar(child: NoticesScreen()),
//     ),
//     GoRoute(
//       path: settingsRoute,
//       name: 'settings',
//       builder: (context, state) =>
//       const ScaffoldWithSidebar(child: SettingsScreen()),
//     ),
//     GoRoute(
//       path: profileRoute,
//       name: 'profile',
//       builder: (context, state) {
//         final user = state.extra as User?;
//         if (user == null) {
//           return const Center(child: Text('User not found'));
//         }
//         return ProfileScreen(user: user);
//       },
//     ),
//   ],
// );
// /*
// enum SidebarItem {
//   dashboard(value: 'Dashboard', iconData: Icons.dashboard),
//   units(value: 'Units', iconData: Icons.business),
//   tenants(value: 'Tenants', iconData: Icons.group),
//   notices(value: 'Notices', iconData: Icons.campaign),
//   settings(value: 'Settings', iconData: Icons.settings);
//
//   const SidebarItem({required this.value, required this.iconData});
//
//   final String value;
//   final IconData iconData;
// }
//
//
//
// class ScaffoldWithSidebar extends StatefulWidget {
//   const ScaffoldWithSidebar({super.key, required this.child});
//
//   final Widget child;
//
//   @override
//   _ScaffoldWithSidebarState createState() => _ScaffoldWithSidebarState();
// }
//
// class _ScaffoldWithSidebarState extends State<ScaffoldWithSidebar> {
//   String selectedRoute = SidebarItem.dashboard.name;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Admin Panel with Custom Sidebar')),
//       body: Row(
//         children: [
//           // Sidebar
//           Container(
//             width: 250, // Set the width of the sidebar
//             color: Colors.blueGrey[100],
//             child: Column(
//               children: SidebarItem.values
//                   .map((item) => ListTile(
//                 title: Text(item.value),
//                 leading: Icon(item.iconData),
//                 selected: selectedRoute == item.name,
//                 onTap: () {
//                   setState(() {
//                     selectedRoute = item.name;
//                   });
//                   context.goNamed(item.name);
//                 },
//               ))
//                   .toList(),
//             ),
//           ),
//           // Main content area
//           Expanded(
//             child: widget.child,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Dashboard Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
// class UnitsScreen extends StatelessWidget {
//   const UnitsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Units Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
// class TenantsScreen extends StatelessWidget {
//   const TenantsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Tenants Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
// class NoticesScreen extends StatelessWidget {
//   const NoticesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Notices Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final user = User(id: '123', name: 'John Doe', age: 30);
//     return Center(
//       child: TextButton(
//         onPressed: () {
//           context.goNamed(profileRoute, extra: user);
//         },
//         child: const Text(
//           'Settings Screen',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   final User user;
//
//   const ProfileScreen({super.key, required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         '${user.name} ${user.id} ${user.age}',
//         style: const TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
// class User {
//   final String id;
//   final String name;
//   final int age;
//
//   User({required this.id, required this.name, required this.age});
// }
//
//  */
