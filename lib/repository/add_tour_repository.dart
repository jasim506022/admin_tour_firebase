import 'package:bd_tour_firebase_admin/data/network/data_firebase_service.dart';
import 'package:bd_tour_firebase_admin/res/apps_function.dart';
import 'package:image_picker/image_picker.dart';

import '../model/tour_model.dart';

class AddTourRepository {
  var dataFirebaseService = DataFirebaseService();

  Future<List<XFile>> getImageFromDevices() async {
    final ImagePicker picker = ImagePicker();
    return picker.pickMultiImage();
  }

  Future<void> uploadTourSnapshot({required TourModel tourModel}) async {
    try {
      await dataFirebaseService.uploadTourSnapshot(tourModel: tourModel);
    } catch (e) {
      AppsFunction.handleException(e);
    }
  }

  Future<void> updateTour({required TourModel tourModel}) async {
    try {
      await dataFirebaseService.updateTour(tourModel: tourModel);
    } catch (e) {
      AppsFunction.handleException(e);
    }
  }

  Future<List<String>> uploadImageStorage(
      {required List<XFile> imageList}) async {
    try {
      return await dataFirebaseService.uploadImageStorage(imageList: imageList);
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }
}
