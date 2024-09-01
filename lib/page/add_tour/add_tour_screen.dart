import 'package:bd_tour_firebase_admin/model/tour_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';

import '../../controller/add_tour_controller.dart';
import '../../controller/main_page_controller.dart';
import '../../res/apps_colors.dart';
import '../responsive.dart';
import '../textfieldformwidget.dart';
import '../textform_title_widget.dart';
import 'image_list_grid.dart';

class AddTourScreen extends StatefulWidget {
  const AddTourScreen({super.key, this.data});

  final Map<String, dynamic>? data;

  @override
  State<AddTourScreen> createState() => _AddTourScreenState();
}

class _AddTourScreenState extends State<AddTourScreen> {
  bool isUpdate = false;
  var controllers = Get.put(AddTourController());
  late TourModel tourModel;

  @override
  void initState() {
    // TODO: implement initState
    if(widget.data != null){
      isUpdate = widget.data!["isUdpate"];
    }

    if (isUpdate) {
      print(isUpdate);
      print("Bangladehs");
      tourModel = widget.data!["tourModel"];
      controllers
        ..tourId.value = tourModel.id!
        ..titleController.text = tourModel.name ?? ""
        ..priceController.text = tourModel.price.toString()
        ..ratingController.text = tourModel.ratting.toString()
        ..addressController.text = tourModel.address ?? ""
        ..detailsController.text = tourModel.details ?? ""
        ..imageXFileList.assignAll(tourModel.imageList?.cast<dynamic>() ?? []);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeader(),
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
                child: const Text(
                  "Upload Image",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownButton(
                borderRadius: BorderRadius.circular(15),
                hint: const Text("Select Tour Category"),
                value: controllers.selectedCategory.value,
                items: sharedPreference!.getStringList("dataList")!.map(
                  (e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  controllers.selectedCategory.value = value.toString();
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildAddTourForm(),
            ElevatedButton(
              style: buildButtonStyle(),
              onPressed: () async {
                controllers.saveToru(selectedValue: controllers.selectedCategory.value,
                    context: context, isUpdate: isUpdate);
                // if(isUpdate){
                //   controllers.updateTour(
                //       selectedValue: controllers.selectedCategory.value,
                //       context: context);
                // }
                // else{
                //   controllers.uploadNewTour(
                //       selectedValue: controllers.selectedCategory.value,
                //       context: context);
                // }

              },
              child: const Text(
                "Upload Tour",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
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

        final containHeight = imageCounter <= 4 ? 190.0 : 280.0;

        return Container(
          height: imageCounter == 0 ? 10 : containHeight,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(10)),
          child: imageCounter == 0
              ? Container(height: 10, color: secondaryColor)
              : const ImageListGridView(),
        );
      },
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          if (Responsive.isMobile(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                final controller = Get.find<MainPageController>();
                controller.controlMenu();
              },
            ),
          Center(
            child: Text(
              isUpdate ? "Update Tour" : "Add New Tour",
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
          ),
        ],
      ),
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
