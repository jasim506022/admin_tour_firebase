
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../controller/add_tour_controller.dart';
import '../../model/tour_model.dart';
import '../../res/apps_colors.dart';
import '../../res/constant.dart';
import '../../widget/category_drop_down_widget.dart';
import '../../widget/responsive.dart';
import '../../widget/textfieldformwidget.dart';
import '../../widget/textform_title_widget.dart';
import 'image_list_grid.dart';

class AddTourScreen extends StatefulWidget {
  const AddTourScreen({
    super.key,
    this.data,
  });

  final Map<String, dynamic>? data;

  @override
  State<AddTourScreen> createState() => _AddTourScreenState();
}

class _AddTourScreenState extends State<AddTourScreen> {
  bool isUpdate = false;
  var controllers = Get.find<AddTourController>();
  late TourModel tourModel;

  @override
  void initState() {
    if (widget.data != null) {
      isUpdate = widget.data!["isUpdate"];
    }

    if (isUpdate) {
      tourModel = widget.data!["tourModel"];
      controllers.initializeTourFields(tourModel);

    }else{
      controllers.clearInputFields();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ConstantData.mq.width * .037),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  isUpdate ? "Update Tour" : "Add New Tour",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _buildImageSection(),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: buildButtonStyle(),
                  onPressed: () async {
                    controllers.getImageFromDevices();
                  },
                  child:  Text(
                    "Upload Image",
                    style: TextStyle(color: AppColors.white),
                  )),
              const SizedBox(
                height: 20,
              ),
              const CategoryDropDownWidget(
                margin: 0.0,
                isAll: false,
              ),
              const SizedBox(
                height: 20,
              ),
              _buildAddTourForm(),
              ElevatedButton(
                style: buildButtonStyle(),
                onPressed: () async {
                  controllers.saveToru(context: context, isUpdate: isUpdate);
                },
                child: const Text(
                  "Upload Tour",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
        padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
        backgroundColor: WidgetStatePropertyAll(AppColors.deepGreen));
  }

  Widget _buildImageSection() {
    return Obx(
      () {
        var imageCounter = controllers.imageXFileList.length;
        final isMobile = Responsive.isMobile(context);
        final containHeight = imageCounter <= 4
            ? (isMobile ? 150.0 : 190.0)
            : (isMobile ? 230.0 : 280.0);
        return Container(
          height: imageCounter == 0 ? 20 : containHeight,
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: imageCounter == 0
              ? Container(height: 10, color: AppColors.secondaryColor)
              : const ImageListGridView(),
        );
      },
    );
  }

  Column _buildAddTourForm() {
    return Column(
      children: [
        TextFormTitleWidget(
          title: 'Title',
          textFieldWidget: TextFieldFormWidget(
            hintText: "Enter Tour Title",
            controller: controllers.titleController,
          ),
        ),
        TextFormTitleWidget(
          title: 'Price',
          textFieldWidget: TextFieldFormWidget(
            hintText: "Enter Tour Price",
            textInputType: TextInputType.number,
            controller: controllers.priceController,
          ),
        ),
        TextFormTitleWidget(
          title: 'Rating',
          textFieldWidget: TextFieldFormWidget(
            hintText: "Enter Default Rating",
            controller: controllers.ratingController,
            textInputType: TextInputType.number,
          ),
        ),
        TextFormTitleWidget(
          title: 'Address',
          textFieldWidget: TextFieldFormWidget(
            hintText: "Enter Tour Location",
            controller: controllers.addressController,
          ),
        ),
        TextFormTitleWidget(
          title: 'Details',
          textFieldWidget: TextFieldFormWidget(
            hintText: "Details",
            maxLines: 8,
            controller: controllers.detailsController,
          ),
        ),
      ],
    );
  }
}
