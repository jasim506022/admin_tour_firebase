import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/apps_colors.dart';
import 'custom_button_widget.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPress,
  });

  final String title;
  final String subtitle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.secondaryColor,
      title: Text(
        title,
        style: GoogleFonts.poppins(
            color: AppColors.yellow, fontWeight: FontWeight.w800, fontSize: 16),
      ),
      content: Text(
        subtitle,
        style: GoogleFonts.poppins(
            color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 14),
      ),
      actions: [
        CustomButtonWidget(
          backgroundColor: AppColors.red,
          title: "Yes",
          function: onPress,
          borderColor: AppColors.red,
          textColor: AppColors.white,
        ),
        CustomButtonWidget(
          backgroundColor: AppColors.secondaryColor,
          title: "No",
          function: () {
            Navigator.pop(context);
          },
          borderColor: AppColors.deepGreen,
          textColor: AppColors.white,
        ),
      ],
    );
  }
}
