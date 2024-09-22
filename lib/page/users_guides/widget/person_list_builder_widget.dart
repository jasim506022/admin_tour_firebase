import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controller/guide_controller.dart';
import '../../../controller/user_controller.dart';
import '../../../model/guide_model.dart';
import '../../../model/user_model.dart';
import '../../../widget/error_widget.dart';
import 'loading_user_widget.dart';
import 'person_row_widget.dart';

class PersonListBuilder extends StatelessWidget {
  const PersonListBuilder({
    super.key,
    this.isUser = true,
  });

  final bool isUser;

  @override
  Widget build(BuildContext context) {
    var userController = Get.find<UserController>();
    var guideController = Get.find<GuideController>();

    final stream = _getStream(context, userController, guideController);

    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPersonWidget();
        }
        if (snapshot.hasError) {
          return FirebaseErrorWidget(
            title: snapshot.error.toString(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const FirebaseErrorWidget(
            title: "No Data Available. Nothing to display at this time.",
          );
        } else if (snapshot.hasData) {
          _populateData(snapshot.data!.docs, userController, guideController);

          return Obx(
            () => ListView.builder(
              itemCount: _getItemCount(userController, guideController),
              itemBuilder: (context, index) {
                if (isUser) {
                  UserModel user = userController.isSearchUser.value &&
                          userController.searchUserTextTEC.text.isNotEmpty
                      ? userController.searchUserList[index]
                      : userController.allUserList[index];
                  return ChangeNotifierProvider.value(
                    value: user,
                    child: PersonRowWidget(
                        isUser: isUser), // Pass the `isUser` flag
                  );
                } else {
                  GuideModel guide = guideController.isSearchGuide.value &&
                          guideController.searchGuideTextTEC.text.isNotEmpty
                      ? guideController.searchGuideList[index]
                      : guideController.allGuideList[index];
                  return ChangeNotifierProvider.value(
                    value: guide,
                    child: PersonRowWidget(
                        isUser: isUser), // Pass the `isUser` flag
                  );
                }
              },
            ),
          );
        }

        return const LoadingPersonWidget();
      },
    );
  }

  int _getItemCount(
      UserController userController, GuideController guideController) {
    return isUser
        ? (userController.isSearchUser.value &&
                userController.searchUserTextTEC.text.isNotEmpty
            ? userController.searchUserList.length
            : userController.allUserList.length)
        : (guideController.isSearchGuide.value &&
                guideController.searchGuideTextTEC.text.isNotEmpty
            ? guideController.searchGuideList.length
            : guideController.allGuideList.length);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? _getStream(BuildContext context,
      UserController userController, GuideController guideController) {
    return isUser
        ? userController.userSnapshot(context)
        : guideController.guideSnapshot(context);
  }

  void _populateData(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs,
      UserController userController, GuideController guideController) {
    if (isUser) {
      userController.allUserList.value =
          docs.map((e) => UserModel.fromMap(e.data())).toList();
    } else {
      guideController.allGuideList.value =
          docs.map((e) => GuideModel.fromMap(e.data())).toList();
    }
  }
}
