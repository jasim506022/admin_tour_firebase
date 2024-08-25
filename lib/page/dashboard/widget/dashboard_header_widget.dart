import 'package:bd_tour_firebase_admin/controller/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';
import '../../main/main_page.dart';
import '../../responsive.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: (){

              final controller = Get.find<MainPageController>();
              controller.controlMenu();

            }
          ),
        if (!Responsive.isMobile(context))
          Text("DashBoard",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 1.5)),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              hintText: 'Search',
              fillColor: secondaryColor,
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2),
                  padding: const EdgeInsets.all(defaultPadding * 0.75),
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              )),
        )),
        Container(
          padding: const EdgeInsets.only(
            left: defaultPadding,
          ),
          margin: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.all(color: Colors.white10),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "asset/image/image.jpg",
                      fit: BoxFit.fill,
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text("Md Jasim Uddin"),
              ),
              const Icon(Icons.keyboard_arrow_down)
            ],
          ),
        )
      ],
    );
  }
}
