import 'package:bd_tour_firebase_admin/repository/tour_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TourController extends GetxController {
  final _tourRepository = TourRepository();

  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot() {
    return _tourRepository.tourSnapshot();
  }

  Future<void> deleteTour({required String id}) async {
    _tourRepository.deleteTour(id: id);
  }
}
