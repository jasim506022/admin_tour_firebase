
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/apps_colors.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:AppColors. secondaryColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: AppColors.deepGreen,
              strokeWidth: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
