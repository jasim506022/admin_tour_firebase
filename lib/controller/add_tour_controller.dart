import 'dart:io';

import 'package:bd_tour_firebase_admin/controller/loading_controller.dart';
import 'package:bd_tour_firebase_admin/repository/add_tour_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../const/const.dart';
import '../page/mainpage.dart';
import '../res/assets/animation_assets.dart';

class AddTourController extends GetxController {
  final _addTourRepository = AddTourRepository();

  var loadingController = Get.put(LoadingController());

  // var imageList = <Uint8List>[].obs;
  var imageXFileList = <XFile>[].obs;
  var imageFile = Rx<XFile?>(null);
  TextEditingController titleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  captureImageFromStorage() async {
    imageFile.value = await _addTourRepository.captureImageFromCamera();
  }

  captureImageFrom() async {

   var imageListXFile = await _addTourRepository.captureImageFrom();
    imageXFileList.addAll(imageListXFile);
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

  printImageUril() async {

    final uniqueImageName = DateTime.now().millisecondsSinceEpoch.toString();
    final mountainsRef =
        FirebaseStorage.instance.ref().child("tour_picture/$uniqueImageName");

    UploadTask task = mountainsRef.putFile(File(imageXFileList[0].path));
    await task.whenComplete(() async {
      // imageUrl.add();
      await mountainsRef.getDownloadURL();
    });

    print(await mountainsRef.getDownloadURL());
  }

  imageUploadedUrl() async {

    final date = DateTime.now();
    final imagesRef = FirebaseStorage.instance
        .ref()
        .child("image")
        .child("20")
        .child("profileImage")
        .child(
            "${date.day}-${date.month}-${date.year}/${date.millisecondsSinceEpoch}");
    UploadTask uploadTask = imagesRef.putFile(File(imageFile.value!.path));
    var taskSnapshot = await uploadTask.whenComplete(
      () {},
    );
    return taskSnapshot.ref.getDownloadURL();
  }

  uploadNewTour(
      {required String selectedValue, required BuildContext context}) async {
    loadingController.setLoading(isLoading: true);

    // FirebaseFirestore.instance.collection("tours").doc("India").set(
    //     {"id":"Bangla"});
    // print("Bangladesh");

    try {
      // print("Bangladesh");
      globalMethod.showMyDialog(
        title: "Okay Uploading Waiting........",
        animationAssets: AnimationAssets.loadingAnimation,
        context: context,
        barrierDismissible: false,

      );
      var uploadImageListUrl =
          await _addTourRepository.imageUploadedUrl(imageList: imageXFileList);

      for(var title in uploadImageListUrl){
        print(title);
      }

      // print("is Okay");

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

      _addTourRepository.uploadNewTourSnapshot(
          tourModel: tourModel, docId: tourId);

      print("Sueccesfull");

      imageXFileList.clear();

      titleController.clear();
      addressController.clear();
      detailsController.clear();
      priceController.clear();
      ratingController.clear();
    } catch (e) {
      print(e.toString());
    }

    Navigator.pop(context);

    globalMethod.showMyDialog(
      title: "Pleasing Waiting........",
      animationAssets: AnimationAssets.loadingAnimation,
      context: context,
      barrierDismissible: false,

    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
      loadingController.setLoading(isLoading: false);
    });
  }
}
