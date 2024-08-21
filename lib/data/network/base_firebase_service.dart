import 'dart:typed_data';

import 'package:bd_tour_firebase_admin/page/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

abstract class BaseFirebaseService {
  FirebaseAuth get auth;

  Reference get reference;

  FirebaseFirestore get firestore;

  Future<List<String>> imageUploadedUrl({required List<XFile> imageList});

  Future<void> uploadNewTourSnapshot({required TourModel tourModel, required String docId});
}
