
import 'package:bd_tour_firebase_admin/controller/main_page_controller.dart';
import 'package:bd_tour_firebase_admin/res/routes/routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const/const.dart';
import 'firebase_options.dart';


Future<void> main() async {
  Get.put(MainPageController());
  sharedPreference = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routeInformationParser: Routers.goRoute.routeInformationParser,
      routerDelegate: Routers.goRoute.routerDelegate,
      routeInformationProvider: Routers.goRoute.routeInformationProvider,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,

      ),
      // home: LogInPage(),

    );
  }
}
//D:\Flutter Project 2024\bd_tour_admin













