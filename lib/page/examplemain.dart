
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../const/const.dart';


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

class MainePageExample extends StatelessWidget {
  const MainePageExample({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Drawer(
              backgroundColor: secondaryColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DrawerHeader(child: Icon(Icons.save)),


                    ListTile(
                      onTap: () {

                      },
                      leading: const Icon(
                        Icons.person,
                        color: Colors.white54,
                        size: 20,
                      ),
                      title: const Text(
                        "Dashboard",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    ListTile(
                      onTap: () {

                      },
                      leading: const Icon(
                        Ionicons.add_circle_outline,
                        color: Colors.white54,
                        size: 20,
                      ),
                      title: const Text(
                        "Add Tour",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    ListTile(
                      onTap: () {


                      },
                      leading: const Icon(
                        Ionicons.add_circle_outline,
                        color: Colors.white54,
                        size: 20,
                      ),
                      title: const Text(
                        "Tours",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    ListTile(
                      onTap: () {


                      },
                      leading: const Icon(
                        Ionicons.add_circle_outline,
                        color: Colors.white54,
                        size: 20,
                      ),
                      title: const Text(
                        "add",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    ListTile(
                      onTap: () {


                      },
                      leading: const Icon(
                        Ionicons.add_circle_outline,
                        color: Colors.white54,
                        size: 20,
                      ),
                      title: const Text(
                        "image",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),


                  ],
                ),
              ),
            )),
        Expanded(
            flex: 5,
            child: Container()

            )
      ]),
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
    final user = User(id: '123', name: 'John Doe', age: 30);
    return Center(
      child: TextButton(
        onPressed: () {
          context.goNamed("profile", extra: user);
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
  final  User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        '${user.name} ${user.id} ${user.age}',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class User {
  final String id;
  final String name;
  final int age;

  User({required this.id, required this.name, required this.age});
}
