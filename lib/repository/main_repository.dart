import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/network/data_firebase_service.dart';
import '../res/apps_function.dart';

class MainRepository {
  final DataFirebaseService _dataFirebaseService = DataFirebaseService();

  Future<DocumentSnapshot<Map<String, dynamic>>> getCategories() async {
    try {
      return await _dataFirebaseService.getCategories();
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> summerySnapshot(
      {required String collection}) {
    try {
      return _dataFirebaseService.summerySnapshot(collection: collection);
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }
}
