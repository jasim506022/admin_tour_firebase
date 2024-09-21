import 'package:flutter/material.dart';

import '../res/apps_colors.dart';
import '../res/constant.dart';

class SearchWidgetTextField extends StatelessWidget {
  const SearchWidgetTextField({
    super.key,
    this.onChanged,
    required this.controller,
    required this.hint,
  });

  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: ConstantData.defaultPadding,
          horizontal: ConstantData.defaultPadding),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white60),
            fillColor: AppColors.secondaryColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greenColor, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greenColor, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greenColor, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            )),
      ),
    );
  }
}
