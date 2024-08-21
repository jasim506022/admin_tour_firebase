import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
      hintText: "Search",
        prefixIcon: Icon(
          Icons.search, color: Colors.grey, size: 21,
        ),
        filled: true,
        fillColor: Colors.blueAccent,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.red
          )
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 5
        )
      ),
    );
  }
}
