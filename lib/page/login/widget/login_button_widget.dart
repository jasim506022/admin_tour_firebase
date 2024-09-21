
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/apps_colors.dart';


class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {super.key, required this.onPressed, required this.buttonText});

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(10),
              )),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        ),
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        label: Text(buttonText,
            style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)));
  }
}
