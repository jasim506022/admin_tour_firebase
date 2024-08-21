
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppException implements Exception {
   String? message;
   String? title;

  AppException([this.message, this.title]);

  @override
  String toString() {
    return 'AppException: message: $message, details: $title';
  }
}

class InternetException extends AppException {
  InternetException(String? message) : super(message!, "no_internet_exception" );
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'request_time_out');
}

class FirebaseAuthExceptions extends AppException {
  final FirebaseAuthException exception;

  FirebaseAuthExceptions(this.exception) : super() {
    _setMessageAndDetails();
  }

  void _setMessageAndDetails() {
    switch (exception.code) {
      case 'email-already-in-use':
        message = 'email-already-in-use';
        title = 'email-already-in-use-title';
        break;
      case 'wrong-password':
        message = 'wrong-password';
        title = 'wrong-password-title';
        break;
      case 'invalid-email':
        message = 'invalid-email';
        title = 'invalid-email-title';
        break;
      case 'invalid-credential':
        message = 'invalid-credential';
        title = 'invalid-credential-title';
        break;
      case 'weak-password':
        message = 'weak-password';
        title = 'weak-password-title';
        break;
      case 'too-many-requests':
        message = 'too-many-requests';
        title = 'too-many-requests-title';
        break;
      case 'operation-not-allowed':
        message = 'operation-not-allowed';
        title = 'operation-not-allowed-title';
        break;
      case 'user-disabled':
        message = 'user-disabled';
        title = 'user-disabled-title';
        break;
      case 'user-not-found':
        message = 'user-not-found';
        title = 'user-not-found-title';
        break;
      default:
        message = 'default-message';
        title = 'default-title';
        break;
    }
  }
}

class OthersException extends AppException {
  OthersException([String? message]) : super(message, 'other_exception');
}