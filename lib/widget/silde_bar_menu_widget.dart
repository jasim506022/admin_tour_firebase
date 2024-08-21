import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../silde_menu_data.dart';

class SildeBarMenuWidget extends StatefulWidget {
  const SildeBarMenuWidget({super.key});

  @override
  State<SildeBarMenuWidget> createState() => _SildeBarMenuWidgetState();
}

class _SildeBarMenuWidgetState extends State<SildeBarMenuWidget> {

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SlideMenuData();
    return Container(

      padding: EdgeInsets.symmetric( vertical: 88,horizontal: 20),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) {
          return buildMenuEntry(data,index);
        },
      ),
    );
  }

  Widget buildMenuEntry(SlideMenuData data, int index) {
    final isSelected = selectIndex == index;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          )
      ),
      child: InkWell(
        onTap: () => setState(() {
          selectIndex = index;
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ?Colors.black: Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                  fontSize: 16,  color: isSelected ?Colors.black: Colors.grey,
                  fontWeight: isSelected?FontWeight.w600: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
