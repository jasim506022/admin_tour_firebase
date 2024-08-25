import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/tour_model.dart';

abstract class BaseFirebaseService {
  FirebaseAuth get auth;

  Reference get reference;

  FirebaseFirestore get firestore;

  Future<List<String>> uploadImageStorage({required List<XFile> imageList});

  Future<void> uploadTourSnapshot({required TourModel tourModel});
}
