
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../const/const.dart';
import '../const/gobalcolor.dart';
import '../model/tour_model.dart';
import '../repository/add_tour_repository.dart';
import '../res/assets/animation_assets.dart';
import 'loading_controller.dart';

class AddTourController extends GetxController {

  var selectedCategory = sharedPreference!.getStringList("dataList")![0].obs;

  final _addTourRepository = AddTourRepository();

  var loadingController = Get.put(LoadingController());


  var imageXFileList = <XFile>[].obs;
  var imageFile = Rx<XFile?>(null);

  TextEditingController titleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();


  getImageFromDevices() async {
    var imageListXFile = await _addTourRepository.getImageFromDevices();
    imageXFileList.addAll(imageListXFile);
  }

  bool validInput(BuildContext context) {
    final requiredFiled = [
      titleController.text,
      addressController.text,
      detailsController.text,
      priceController.text,
      ratingController.text
    ];

    if (requiredFiled.any(
      (element) => element.trim().isEmpty,
    )) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  Text("Please fill in the all text field",
            style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 3),
          backgroundColor: AppColors.red,

        ),
      );
      return false;
    }
    return true;
  }

  uploadNewTour(
      {required String selectedValue, required BuildContext context}) async {
    loadingController.setLoading(isLoading: true);

    if (validInput(context)==false) return;

    try {
      globalMethod.showMyDialog(
        title: "Okay Uploading Waiting........",
        animationAssets: AnimationAssets.loadingAnimation,
        context: context,
        barrierDismissible: false,
      );
      var uploadImageListUrl =
          await _addTourRepository.uploadImageStorage(imageList: imageXFileList);

      final tourId = DateTime.now().millisecondsSinceEpoch.toString();

      TourModel tourModel = TourModel(
          category: selectedValue,
          name: titleController.text,
          address: addressController.text,
          details: detailsController.text,
          imageList: uploadImageListUrl,
          price: double.parse(priceController.text),
          ratting: double.parse(ratingController.text),
          id: tourId);

      _addTourRepository.uploadTourSnapshot(
          tourModel: tourModel, docId: tourId);

      imageXFileList.clear();

      titleController.clear();
      addressController.clear();
      detailsController.clear();
      priceController.clear();
      ratingController.clear();
    } catch (e) {

      if (kDebugMode) {
        print(e.toString());
      }

    }

    Navigator.pop(context);

    globalMethod.showMyDialog(
      title: "Successfully Upload........",
      animationAssets: AnimationAssets.loadingAnimation,
      context: context,
      barrierDismissible: false,
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      loadingController.setLoading(isLoading: false);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    addressController.dispose();
    detailsController.dispose();
    priceController.dispose();
    ratingController.dispose();
    super.dispose();
  }
}
