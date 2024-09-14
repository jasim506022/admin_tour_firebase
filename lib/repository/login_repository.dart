
import 'package:firebase_auth/firebase_auth.dart';

import '../data/network/data_firebase_service.dart';
import '../res/apps_function.dart';

class LoginRepository {
  final DataFirebaseService _dataFirebaseService = DataFirebaseService();

  Future<UserCredential> signWithEmailPassword(
      {required String email, required String password}) async {
    try {
      return await _dataFirebaseService.signWithEmailPassword(
          email: email, password: password);
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      return await _dataFirebaseService.getCurrentUser();
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }
}
