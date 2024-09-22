
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/response/app_exception.dart';
import '../model/tour_model.dart';
import '../repository/add_tour_repository.dart';
import '../res/apps_function.dart';
import 'category_controller.dart';
import 'loading_controller.dart';

class AddTourController extends GetxController {
  AddTourRepository addTourRepository;

  AddTourController(this.addTourRepository);

  var loadingController = Get.put(LoadingController());
  var categoryController = Get.find<CategoryController>();

  var tourId = "".obs;
  var imageXFileList = <dynamic>[].obs;

  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final detailsController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();

  void removeImage({required int index}) => imageXFileList.removeAt(index);

  void initializeTourFields(TourModel tourModel) {
    tourId.value = tourModel.id!;
    titleController.text = tourModel.name ?? "";
    priceController.text = tourModel.price.toString();
    ratingController.text = tourModel.ratting.toString();
    addressController.text = tourModel.address ?? "";
    detailsController.text = tourModel.details ?? "";
    imageXFileList.assignAll(tourModel.imageList?.cast<dynamic>() ?? []);
    categoryController.selectedCategory.value = tourModel.category ?? "";
  }

  Future<void> getImageFromDevices() async {
    imageXFileList.addAll(await addTourRepository.getImageFromDevices());
  }

  Future<void> saveToru(
      {required BuildContext context, required bool isUpdate}) async {
    loadingController.setLoading(isLoading: true);

    if (!isInputValidateFields(context)) return;

    try {
      final loadingTitle =
          isUpdate ? "Updating... Please wait." : "Uploading... Please wait.";
      AppsFunction.showMyDialog(context: context, title: loadingTitle);

      if (!isUpdate) {
        tourId.value = DateTime.now().millisecondsSinceEpoch.toString();
      }

      List<XFile> xFileList = _extractXFilesFromList(imageXFileList);

      List<String> existingImageUrls =
          _extractExistingImageUrls(imageXFileList, isUpdate);

      var uploadImageListUrl =
          await addTourRepository.uploadImageStorage(imageList: xFileList);

      if (isUpdate) {
        uploadImageListUrl.addAll(existingImageUrls);
      }
      TourModel tourModel = _buildTourModel(uploadImageListUrl);
      if (isUpdate) {
        await addTourRepository.updateTour(tourModel: tourModel);
      } else {
        addTourRepository.uploadTourSnapshot(tourModel: tourModel);
      }

      clearInputFields();
      if (!context.mounted) return;
      Navigator.pop(context);
      AppsFunction.showMyDialog(
          context: context,
          title: isUpdate ? "Successfully Update" : "Successfully upload");

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
        loadingController.setLoading(isLoading: false);
      });
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.toString());
      }
    }
  }

  bool isInputValidateFields(BuildContext context) {
    final requiredFiled = [
      titleController.text,
      addressController.text,
      detailsController.text,
      priceController.text,
      ratingController.text
    ];
    if (imageXFileList.isEmpty) {
      AppsFunction.showSnackBar(
          context, "At least one image must be selected for upload.");
      return false;
    }

    if (requiredFiled.any(
      (element) => element.trim().isEmpty,
    )) {
      AppsFunction.showSnackBar(
          context, "Please complete all required fields before submitting.");
      return false;
    }
    final isPriceValid = double.tryParse(priceController.text) != null;
    final isRatingValid = double.tryParse(ratingController.text) != null;

    if (!isPriceValid || !isRatingValid) {
      AppsFunction.showSnackBar(context, "Price and Ratting Allow Only Digit");
      return false;
    }
    return true;
  }

  List<XFile> _extractXFilesFromList(List<dynamic> imageList) {
    return imageList.whereType<XFile>().toList();
  }

  List<String> _extractExistingImageUrls(
      List<dynamic> imageList, bool isUpdate) {
    if (!isUpdate) return [];
    imageList.removeWhere((image) => image is XFile);
    return imageList.cast<String>().toList();
  }

  TourModel _buildTourModel(List<String> uploadImageListUrl) {
    return TourModel(
        category: categoryController.selectedCategory.value,
        name: titleController.text,
        address: addressController.text,
        details: detailsController.text,
        imageList: uploadImageListUrl,
        price: double.parse(priceController.text),
        ratting: double.parse(ratingController.text),
        id: tourId.value);
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

  void clearInputFields() {
    imageXFileList.clear();
    titleController.clear();
    addressController.clear();
    detailsController.clear();
    priceController.clear();
    ratingController.clear();
    categoryController.selectedCategory.value =
        categoryController.categories[0];
  }
}
