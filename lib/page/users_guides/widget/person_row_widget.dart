import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/guide_model.dart';
import '../../../model/user_model.dart';
import '../../../res/apps_colors.dart';
import 'person_details_dialog_widget.dart';


class PersonRowWidget extends StatelessWidget {
  const PersonRowWidget({super.key, this.isUser = true});

  final bool? isUser;

  @override
  Widget build(BuildContext context) {
    dynamic model = isUser!
        ? Provider.of<UserModel>(context)
        : Provider.of<GuideModel>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _rowImageCell(model.image!),
            _rowCellData(title: (model.name!.isEmpty ? "N/A" : model.name!)),
            _rowCellData(
                title: model.phone!.isEmpty ? "N/A" : model!.phone!, flex: 3),
            _rowCellData(
                title: model.email!.isEmpty ? "N/A" : model.email!, flex: 5),
            _rowCellData(title: model.status!, flex: 3),
            _rowViewModel(
                title: "View User", userModel: model, context: context),
          ],
        ),
        const Divider()
      ],
    );
  }

  Expanded _rowImageCell(String imageUrl) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: imageUrl.isEmpty
                  ? Image.asset("asset/image/image.jpg", fit: BoxFit.fill)
                  : Image.network(imageUrl, fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _rowCellData({required String title, int flex = 4}) {
    return Expanded(
        flex: flex,
        child: Text(
          title,
          style: TextStyle(
            color: title == "approved"
                ? AppColors.yellow
                : title == "not_approved"
                    ? AppColors.red
                    : Colors.white.withOpacity(.85),
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  _rowViewModel(
      {required String title,
      required dynamic userModel,
      required BuildContext context}) {
    return Expanded(
        flex: 4,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return PersonDetailDialogWidget(personModel: userModel);
              },
            );
          },
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.greenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
