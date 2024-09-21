import 'package:bd_tour_firebase_admin/res/apps_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/network/data_firebase_service.dart';

class GuideRepository {
  var dataFirebaseService = DataFirebaseService();

  Stream<QuerySnapshot<Map<String, dynamic>>> guideSnapshot() {
    try {
      return dataFirebaseService.guideSnapshot();
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }
}
