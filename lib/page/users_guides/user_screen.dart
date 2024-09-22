
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controller/user_controller.dart';
import '../../model/user_model.dart';
import '../../res/apps_colors.dart';
import '../../res/constant.dart';
import '../../widget/search_widget_text_field.dart';
import '../../widget/error_widget.dart';

import '../users_guides/widget/loading_user_widget.dart';
import 'widget/person_list_builder_widget.dart';
import 'widget/person_row_widget.dart';
import 'widget/table_header_widget.dart';



class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userController = Get.find<UserController>();
    return
      Scaffold(
        body: Container(
          margin: const EdgeInsets.all(ConstantData.defaultPadding),
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              SearchWidgetTextField(
                controller: userController.searchUserTextTEC,
                onChanged: (text) {
                  userController.filterUser(text);
                },
                hint: 'Search User',
              ),
              const TableHeaderWidget(),
              const SizedBox(
                height: ConstantData.defaultPadding,
              ),
              const Expanded(
                child: PersonListBuilder(

                ),
              )
            ],
          ),
        ),
      );

  }
}
