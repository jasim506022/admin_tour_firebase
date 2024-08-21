import 'dart:typed_data';

import 'package:bd_tour_firebase_admin/data/network/data_firebase_service.dart';
import 'package:image_picker/image_picker.dart';

import '../page/mainpage.dart';

class AddTourRepository {
  var dataFirebaseService = DataFirebaseService();

  Future<List<XFile>> captureImageFrom() async {
    final ImagePicker picker = ImagePicker();
    return picker.pickMultiImage();
  }
  Future<XFile?> captureImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    return  picker.pickImage(source: ImageSource.gallery);
  }

  Future<void> uploadNewTourSnapshot(
      {required TourModel tourModel, required String docId}) async {
    await dataFirebaseService.uploadNewTourSnapshot(
        tourModel: tourModel, docId: docId);
  }

  Future<List<String>> imageUploadedUrl(
      {required List<XFile> imageList}) async {
    return await dataFirebaseService.imageUploadedUrl(imageList: imageList);
  }
}
