import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  String? email;
  String? name;
  String? phone;
  String? status;
  String? uid;
  String? gender;
  String? image;
  String? address;
  Timestamp? dateOfBirth;

  UserModel(
      {this.gender,
      this.email,
      this.name,
      this.phone,
      this.status,
      this.uid,
      this.image,
      this.address,
      this.dateOfBirth});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      gender: map['gender'],
      name: map['name'],
      phone: map['phone'],
      status: map['status'],
      uid: map['uid'],
      image: map["image"],
      address: map["address"],
      dateOfBirth: map["dateOfBirth"],
    );
  }
}
