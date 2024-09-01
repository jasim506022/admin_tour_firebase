
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../const/const.dart';
import '../model/tour_model.dart';
import '../repository/add_tour_repository.dart';
import '../res/apps_colors.dart';
import '../res/assets/animation_assets.dart';
import 'loading_controller.dart';

class AddTourController extends GetxController {
  var selectedCategory = sharedPreference!.getStringList("dataList")![0].obs;

  final _addTourRepository = AddTourRepository();

  var loadingController = Get.put(LoadingController());
  var tourId = "".obs;

  var imageXFileList = <dynamic>[].obs;
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
          (element) =>
      element
          .trim()
          .isEmpty,
    )) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please fill in the all text field",
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          duration: const Duration(seconds: 3),
          backgroundColor: AppColors.red,
        ),
      );
      return false;
    }
    return true;
  }

  void _showLoadingDialog(BuildContext context, String title) {
    globalMethod.showMyDialog(
      title: title,
      animationAssets: AnimationAssets.loadingAnimation,
      context: context,
      barrierDismissible: false,
    );
  }

    Future<void> saveToru(
        {required String selectedValue, required BuildContext context, required bool isUpdate}) async {
      loadingController.setLoading(isLoading: true);
      if (!validInput(context)) return;
      try {
        _showLoadingDialog(context,
            isUpdate ? "Okay Update and waiting" : "Okay Upload and Waiting");

        List<String> convertStringList = [];

        if (!isUpdate) {
          tourId.value = DateTime
              .now()
              .millisecondsSinceEpoch
              .toString();
        }


        List<XFile> xFileList = imageXFileList.whereType<XFile>().toList();
        if (isUpdate) {
          imageXFileList.removeWhere((element) => element is XFile);
          convertStringList =
              imageXFileList.map((element) => element.toString()).toList();
        }

        var uploadImageListUrl =
        await _addTourRepository.uploadImageStorage(imageList: xFileList);

        if (isUpdate) {
          uploadImageListUrl.addAll(convertStringList);
        }

        TourModel tourModel = TourModel(
            category: selectedValue,
            name: titleController.text,
            address: addressController.text,
            details: detailsController.text,
            imageList: uploadImageListUrl,
            price: double.parse(priceController.text),
            ratting: double.parse(ratingController.text),
            id: tourId.value);

        if (isUpdate) {
          await _addTourRepository.updateTour(tourModel: tourModel);
        } else {
          _addTourRepository.uploadTourSnapshot(
              tourModel: tourModel, docId: tourId.value);
        }

        imageXFileList.clear();

        titleController.clear();
        addressController.clear();
        detailsController.clear();
        priceController.clear();
        ratingController.clear();

        Navigator.pop(context);
        _showLoadingDialog(context,
            isUpdate ? "Successfully Update" : "Successfully upload");


        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          loadingController.setLoading(isLoading: false);
        });
      } catch (e) {
        print(e);
      }
    }


    /*
  uploadNewTour(
      {required String selectedValue, required BuildContext context}) async {
    loadingController.setLoading(isLoading: true);

    if (validInput(context) == false) return;

    try {
      globalMethod.showMyDialog(
        title: "Okay Uploading Waiting........",
        animationAssets: AnimationAssets.loadingAnimation,
        context: context,
        barrierDismissible: false,
      );

      List<XFile> xFileList = imageXFileList.cast<XFile>();

      var uploadImageListUrl =
          await _addTourRepository.uploadImageStorage(imageList: xFileList);



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

  updateTour(
      {required String selectedValue, required BuildContext context}) async {
    loadingController.setLoading(isLoading: true);

    if (validInput(context) == false) return;

    try {
      globalMethod.showMyDialog(
        title: "Okay Uploading Waiting........",
        animationAssets: AnimationAssets.loadingAnimation,
        context: context,
        barrierDismissible: false,
      );

      print(imageXFileList.length);

      List<XFile> xFileList = imageXFileList.whereType<XFile>().toList();

      imageXFileList.removeWhere((element) => element is XFile);

      List<String> convertStringList =
          imageXFileList.map((element) => element.toString()).toList();

      var uploadImageListUrl =
          await _addTourRepository.uploadImageStorage(imageList: xFileList);
      uploadImageListUrl.addAll(convertStringList);

      print(uploadImageListUrl.length);

      // uploadImageListUrl.addAll(convertStringList);

      // final tourId = DateTime.now().millisecondsSinceEpoch.toString();
      print(tourId.value);

      TourModel tourModel = TourModel(
          category: selectedValue,
          name: titleController.text,
          address: addressController.text,
          details: detailsController.text,
          imageList: uploadImageListUrl,
          price: double.parse(priceController.text),
          ratting: double.parse(ratingController.text),
          id: tourId.value);

      _addTourRepository.updateTour(tourModel: tourModel);

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
      title: "Successfully Update........",
      animationAssets: AnimationAssets.loadingAnimation,
      context: context,
      barrierDismissible: false,
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      loadingController.setLoading(isLoading: false);
    });
  }



   */


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
