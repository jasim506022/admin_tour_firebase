import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../res/apps_colors.dart';

class TextFieldFormWidget extends StatefulWidget {
  TextFieldFormWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.autofocus = false,
      this.obscureText = false,
      this.isShowPassword = false,
      this.enable = true,
      this.textInputAction = TextInputAction.next,
      this.maxLines = 1,
      this.textInputType = TextInputType.text,
        this.validator,
      this.icon});

  final String hintText;
  final TextEditingController controller;
  final bool? autofocus;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool enable;
  bool? obscureText;
  final bool? isShowPassword;
  final String? icon;

  String? Function(String?)? validator;

  @override
  State<TextFieldFormWidget> createState() => _TextFieldFormWidgetState();
}

class _TextFieldFormWidgetState extends State<TextFieldFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: TextFormField(

            controller: widget.controller,
            autofocus: widget.autofocus!,
            maxLines: widget.maxLines,
            validator: widget.validator,
            enabled: widget.enable,
            obscureText: widget.obscureText!,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: widget.enable
                    ? Theme.of(context).primaryColor
                    : Colors.black),
            decoration: InputDecoration(
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              fillColor: AppColors.searchColor,
              filled: true,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: widget.isShowPassword!
                  ? IconButton(
                      onPressed: () {
                        widget.obscureText = !widget.obscureText!;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.password,
                        color: widget.obscureText!
                            ? AppColors.hintLightColor
                            : AppColors.red,
                      ))
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintStyle: TextStyle(
                color: AppColors.hintTextColor,
              ),
            )));
  }
}
