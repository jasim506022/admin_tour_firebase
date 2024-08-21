import 'dart:io';
import 'dart:typed_data';

import 'package:bd_tour_firebase_admin/data/network/base_firebase_service.dart';
import 'package:bd_tour_firebase_admin/page/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class DataFirebaseService implements BaseFirebaseService {
  @override
  // TODO: implement auth
  FirebaseAuth get auth => FirebaseAuth.instance;

  @override
  Future<List<String>> imageUploadedUrl(
      {required List<XFile> imageList}) async {
    List<String> imageUrlList = [];

    for (var image in imageList) {
      await postImages(image)
          .then((downLoadUrl) => imageUrlList.add(downLoadUrl));
    }
    return imageUrlList;
  }

  Future<String> postImages(XFile? imageFile) async {
    final uniqueImageName = DateTime.now().millisecondsSinceEpoch.toString();
    String imageUrl = "";
    final mountainsRef = reference
        .child("tour_picture")
        .child("images")
        .child("${imageFile!.name}_ $uniqueImageName");
    if (kIsWeb) {
      await mountainsRef.putData(
        await imageFile.readAsBytes(),
        SettableMetadata(contentType: "image/jpeg"),
      );
      imageUrl = await mountainsRef.getDownloadURL();
    }
    return imageUrl;
  }

  @override
  Reference get reference => FirebaseStorage.instance.ref();

  @override
  // TODO: implement firestore
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<void> uploadNewTourSnapshot(
      {required TourModel tourModel, required String docId}) async {
    firestore.collection("tours").doc(docId).set(tourModel.toMap());
  }
}

/*

Future<List<String>> imageUpload () async{
  final uniqueImageName =
  DateTime.now().millisecondsSinceEpoch.toString();
  List<String> imageUrl = [];

  for (var element in image) {
    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef =
    storageRef.child("tour_picture/$uniqueImageName");

    UploadTask task = mountainsRef.putData(element!);
    await task.whenComplete(() async {
      imageUrl.add(await mountainsRef.getDownloadURL());
    });
  }
  return imageUrl;
}

@override
Future<String> imageUploadedUrl({required String path}) async {
  final date = DateTime.now();
  final imagesRef = storageReference
      .child("image")
      .child(auth.currentUser!.uid)
      .child("profileImage")
      .child(
      "${date.day}-${date.month}-${date.year}/${date.millisecondsSinceEpoch}");
  UploadTask uploadTask = imagesRef.putFile(File(path));
  var taskSnapshot = await uploadTask.whenComplete(
        () {},
  );
  return taskSnapshot.ref.getDownloadURL();
}
 */
