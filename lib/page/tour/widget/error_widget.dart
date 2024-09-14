import 'package:bd_tour_firebase_admin/res/apps_colors.dart';
import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../res/assets/image_assets.dart';

class FirebaseErrorWidget extends StatelessWidget {
  const FirebaseErrorWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Image.asset(
          ImageAssets.imageError,
          height: mq.height * .9,
          width: mq.width * .9,
        )),
        Positioned(
          left: mq.width * .36,
          top: mq.height * .24,
          right: mq.width * .23,
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
      ],
    );
  }
}
