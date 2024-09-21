import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/tour_model.dart';
import 'base_firebase_service.dart';

class DataFirebaseService implements BaseFirebaseService {
  @override
  // TODO: implement auth
  FirebaseAuth get auth => FirebaseAuth.instance;

  @override
  Future<User?> getCurrentUser() async => auth.currentUser;

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getCategories() async {
    return firestore.collection("categories").doc("category").get();
  }

  @override
  Future<List<String>> uploadImageStorage(
      {required List<XFile> imageList}) async {
    List<String> imageUrlList = [];

    for (var image in imageList) {
      await postImages(image)
          .then((downLoadUrl) => imageUrlList.add(downLoadUrl));
    }
    return imageUrlList;
  }

  Future<String> postImages(XFile? imageFile) async {
    final uniqueImageName =
        "${imageFile!.name}_${DateTime.now().millisecondsSinceEpoch}";

    final ref = reference.child("tour_picture/images/$uniqueImageName");

    if (kIsWeb) {
      final data = await imageFile.readAsBytes();
      await ref.putData(
        data,
        SettableMetadata(contentType: "image/jpeg"),
      );
    }
    return ref.getDownloadURL();
  }

  @override
  Reference get reference => FirebaseStorage.instance.ref();

  @override
  // TODO: implement firestore
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<void> uploadTourSnapshot({required TourModel tourModel}) async {
    firestore.collection("tours").doc(tourModel.id).set(tourModel.toMap());
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot(
      {required String category}) {
    return category == "All"
        ? firestore
            .collection("tours")
            .orderBy("id", descending: true)
            .snapshots()
        : firestore
            .collection("tours")
            .where("category", isEqualTo: category)
            .orderBy(
              "category",
            )
            .orderBy("id", descending: true)
            .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> popularSnapshot() {
    return firestore
        .collection("tours")
        .where("ratting", isGreaterThan: 3.8)
        .orderBy("id", descending: true)
        .snapshots();
  }

  @override
  Future<void> deleteTour({required String id}) async {
    await firestore.collection("tours").doc(id).delete();
  }

  @override
  Future<void> updateTour({required TourModel tourModel}) async {
    // TODO: implement updateTour
    await firestore
        .collection("tours")
        .doc(tourModel.id)
        .update(tourModel.toMap());
  }

  @override
  Future<UserCredential> signWithEmailPassword(
      {required String email, required String password}) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> summerySnapshot(
      {required String collection}) {
    return firestore.collection(collection).snapshots();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> singleTourSnapshot(
      {required String id}) {
    return firestore.collection('tours').doc(id).get();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> userSnapshot() {
    return firestore.collection("user").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> guideSnapshot() {
    return firestore.collection("guide").snapshots();
  }

  @override
  Future<void> signOut() async {
    auth.signOut();
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
