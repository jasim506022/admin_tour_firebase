import 'package:bd_tour_firebase_admin/data/network/data_firebase_service.dart';
import 'package:image_picker/image_picker.dart';

import '../model/tour_model.dart';

class AddTourRepository {
  var dataFirebaseService = DataFirebaseService();

  Future<List<XFile>> getImageFromDevices() async {
    final ImagePicker picker = ImagePicker();
    return picker.pickMultiImage();
  }

  Future<void> uploadTourSnapshot(
      {required TourModel tourModel, required String docId}) async {
    await dataFirebaseService.uploadTourSnapshot(tourModel: tourModel);
  }

  Future<void> updateTour({required TourModel tourModel}) async {
    await dataFirebaseService.updateTour(tourModel: tourModel);
  }

  Future<List<String>> uploadImageStorage(
      {required List<XFile> imageList}) async {
    return await dataFirebaseService.uploadImageStorage(imageList: imageList);
  }
}
