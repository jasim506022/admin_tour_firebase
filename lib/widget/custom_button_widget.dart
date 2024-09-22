import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.function,
      required this.title,
      required this.backgroundColor,
      required this.borderColor,
      required this.textColor, this.verticalPadding = 12,

      });

  final VoidCallback function;
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor, width: 2),
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding:  EdgeInsets.symmetric(horizontal: 25, vertical: verticalPadding!),
        ),
        onPressed: function,
        child: Text(title,
            style: GoogleFonts.poppins(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 14)));
  }
}
