import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/network/data_firebase_service.dart';

class TourRepository {
  var dataFirebaseService = DataFirebaseService();

  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot() {
    return dataFirebaseService.tourSnapshot();
  }

  Future<void> deleteTour({required String id}) async {
    await dataFirebaseService.deleteTour(id: id);
  }
}
