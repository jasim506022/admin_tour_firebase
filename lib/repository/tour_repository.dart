import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/network/data_firebase_service.dart';
import '../res/apps_function.dart';

class TourRepository {
  var dataFirebaseService = DataFirebaseService();

  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot(
      {required String category}) {
    try {
      return dataFirebaseService.tourSnapshot(category: category);
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> popularSnapshot() {
    try {
      return dataFirebaseService.popularSnapshot();
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }

  Future<void> deleteTour({required String id}) async {
    try {
      await dataFirebaseService.deleteTour(id: id);
    } catch (e) {
      AppsFunction.handleException(e);
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> singleTourSnapshot(
      {required String id}) {
    try {
      return dataFirebaseService.singleTourSnapshot(id: id);
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }
}
