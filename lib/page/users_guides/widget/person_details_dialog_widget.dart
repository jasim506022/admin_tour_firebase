
import 'package:bd_tour_firebase_admin/res/assets/image_assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';



class PersonDetailDialogWidget extends StatelessWidget {
  const PersonDetailDialogWidget({super.key, required this.personModel});

  final dynamic personModel;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      backgroundColor: AppColors.secondaryColor,
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: personModel.image!.isEmpty
                              ? Image.asset(
                                  ImageAssets.adminImage,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  personModel.image!,
                                  fit: BoxFit.fill,
                                )),
                    ),
                    const SizedBox(
                      height: ConstantData.defaultPadding,
                    ),
                    Text(
                      personModel.name!,
                      style: const TextStyle(
                          color: AppColors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  width: ConstantData.defaultPadding,
                ),
                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRichText(
                          title: "Email", subTitle: personModel.email!),
                      _buildRichText(
                          title: "Phone", subTitle: personModel.phone!),
                      _buildRichText(
                          title: "DOM",
                          subTitle: _formatTimestamp(personModel.dateOfBirth)),
                      _buildRichText(
                          title: "Gender", subTitle: personModel.gender!),
                      _buildRichText(
                          title: "Address",
                          subTitle: personModel.address!.isEmpty
                              ? "N/A"
                              : personModel.address!),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: AppColors.deepBlue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60, vertical: ConstantData.defaultPadding)),
              child: Text(
                personModel.status,
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            const SizedBox(height: ConstantData.defaultPadding,),

            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.red,
                    ),
                child: Text(
                  "Close",
                  style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            )

          ],
        )
      ],
    );
  }

  RichText _buildRichText({required String title, required String subTitle}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "$title: ",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.white),
      ),
      const WidgetSpan(
        child: SizedBox(width: 10), // You can adjust the width
      ),
      TextSpan(
        text: subTitle,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.yellow),
      ),
    ]));
  }

  String _formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return "N/A";
    final dateTime = timestamp.toDate();
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
