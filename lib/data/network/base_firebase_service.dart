import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/tour_model.dart';

abstract class BaseFirebaseService {
  FirebaseAuth get auth;

  Reference get reference;

  FirebaseFirestore get firestore;

  Future<UserCredential> signWithEmailPassword({required String email, required String password});

  Future<List<String>> uploadImageStorage({required List<XFile> imageList});
  Future<void> uploadTourSnapshot({required TourModel tourModel});
  // Query Documentation
  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot();

  Future<void> deleteTour({required String id});
  Future<void> updateTour({required TourModel tourModel});



}
