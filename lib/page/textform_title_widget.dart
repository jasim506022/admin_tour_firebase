
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/gobalcolor.dart';

class TextFormTitleWidget extends StatelessWidget {
  const TextFormTitleWidget({
    super.key, required this.title, required this.textFieldWidget,
  });
  final String title;
  final Widget textFieldWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
          GoogleFonts.poppins(
              fontSize: 16,

              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: AppColors.white),
        ),
        textFieldWidget,
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

