import '../data/network/data_firebase_service.dart';
import '../res/apps_function.dart';

class ProfileRepository {
  var dataFirebaseService = DataFirebaseService();

  Future<void> signOut() async {
    try {
      await dataFirebaseService.signOut();
    } catch (e) {
      AppsFunction.handleException(e);
    }
  }
}
