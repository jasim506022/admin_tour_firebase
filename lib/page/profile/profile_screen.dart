import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/profile_controller.dart';
import '../../res/apps_colors.dart';
import '../../res/assets/image_assets.dart';
import '../../res/constant.dart';
import '../../res/string_constant.dart';
import '../../widget/confirmation_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var profileController = Get.find<ProfileController>();
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        ImageAssets.adminImage,
                      )),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 3)),
            ),
            const SizedBox(
              height: ConstantData.defaultPadding,
            ),
            Text(
              StringConstant.adminName,
              style: GoogleFonts.patuaOne(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: AppColors.yellow,
                  letterSpacing: 1.5),
            ),
            const SizedBox(
              height: ConstantData.defaultPadding,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ConfirmationDialog(
                        onPress: () {
                          profileController.signOut(context);
                        },
                        title: 'Sign Out',
                        subtitle: 'Are you sure you want to sign out?',
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                label: Text("Sign Out",
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)))
          ],
        ),
      ),
    );
  }
}
