

import 'package:flutter/material.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.title,
    required this.textColor, required this.function,
  });

  final Color backgroundColor;
  final Color borderColor;
  final String title;
  final Color textColor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(backgroundColor),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(color: borderColor, width: 2),
                  borderRadius: BorderRadius.circular(5))),
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 17))),
          onPressed: function,
          child: Text(
            title,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }
}
