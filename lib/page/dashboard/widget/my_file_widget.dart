import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/const.dart';
import '../../responsive.dart';
import '../dashboard_screen.dart';
import 'file_grid_view.dart';

class MyFileWidget extends StatelessWidget {
  const MyFileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding)),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                "Add New",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            )
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Responsive(
            mobile: FileGridView(
                crossAxisCount: size.width < 650 ? 2 : 4,
                childAspectRatio:
                    size.width < 650 && size.width > 350 ? 1.3 : 1),
            tablet: const FileGridView(),
            desktop:
                FileGridView(childAspectRatio: size.width < 1400 ? 1.1 : 1.4)),
      ],
    );
  }
}
