import 'package:firebase_auth/firebase_auth.dart';

import '../data/network/data_firebase_service.dart';

class LoginRepository {
  final DataFirebaseService _dataFirebaseService = DataFirebaseService();

  Future<UserCredential> signWithEmailPassword(
      {required String email, required String password}) {
    return _dataFirebaseService.signWithEmailPassword(
        email: email, password: password);
  }
}
