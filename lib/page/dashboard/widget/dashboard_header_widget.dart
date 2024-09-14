import 'package:bd_tour_firebase_admin/res/apps_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/const.dart';
import '../../../controller/main_page_controller.dart';
import '../../../controller/save_local.dart';
import '../../../model/menu_model.dart';
import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';
import '../../../res/routes/routes_name.dart';
import '../../../widget/responsive.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainPageController>();
    return Row(
      children: [
        // Menu Icon for when Screen size is not Desktop
        if (!Responsive.isDesktop(context))
          IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                if (scaffoldKey.currentState != null &&
                    !scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.openDrawer();
                }
              }),
        // Dashboard  screens for Tablet and Desktop
        if (!Responsive.isMobile(context))
          Text("DashBoard",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 1.5)),

        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        Expanded(
            child: InkWell(
                onTap: () {
                  AppsFunction.navigatorChange(
                      context, controller, SidebarItem.searchScreen);
                },
                child: _buildSearchTextField())),

        _buildAbout(context, controller)
      ],
    );
  }

  Container _buildAbout(BuildContext context, MainPageController controller) {
    return Container(
      height: 60,
      width: 250,
      padding: const EdgeInsets.only(
        left: ConstantData.defaultPadding,
      ),
      margin: const EdgeInsets.symmetric(
          horizontal: ConstantData.defaultPadding, vertical: ConstantData.defaultPadding / 2),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          border: Border.all(color: Colors.white10),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          PopupMenuButton<String>(
            color:AppColors. secondaryColor,
            onSelected: (value) {
              if (value == 'sign_out') {
                FirebaseAuth.instance.signOut();
                GoRouter.of(context)
                    .pushReplacementNamed(RoutesName.initialRoute);
              } else if (value == 'profile') {
                AppsFunction.navigatorChange(
                    context, controller, SidebarItem.addTourScreen);
              }
            },
            itemBuilder: (context) => [
              _buildPopupMenuItem(
                  value: 'profile', title: "Profile", icon: Icons.person),
              _buildPopupMenuItem(
                  value: 'sign_out', title: "Sign Out", icon: Icons.logout),
            ],
            icon: const Icon(
              IconlyLight.arrowDown2,
              color: Colors.yellow,
            ), // Custom icon here
          ),
          Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  "asset/image/image.jpg",
                  fit: BoxFit.fill,
                ),
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: ConstantData.defaultPadding / 2),
            child: Text("Md Jasim Uddin"),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(
      {required String value, required IconData icon, required String title}) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(title)
        ],
      ),
    );
  }

  Container _buildSearchTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        // shape: BorderSide.none,
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          const Text(
            "Search Here",
            style: TextStyle(color: Colors.white60),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(ConstantData.defaultPadding * 0.75),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Icon(
              Icons.search,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
