import 'package:bd_tour_firebase_admin/res/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'binding/all_binding.dart';

import 'firebase_options.dart';
import 'res/apps_colors.dart';
import 'res/routes/routers.dart';

Future<void> main() async {
  ConstantData.sharedPreference = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ConstantData.mq = MediaQuery.of(context).size;
    return GetMaterialApp.router(
      initialBinding: AllBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routeInformationParser: Routers.goRoute.routeInformationParser,
      routerDelegate: Routers.goRoute.routerDelegate,
      routeInformationProvider: Routers.goRoute.routeInformationProvider,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: AppColors.secondaryColor,
      ),
      // home: LogInPage(),
    );
  }
}
//D:\Flutter Project 2024\bd_tour_admin
// flutter run -d chrome --web-renderer html
