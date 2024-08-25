
import 'package:flutter/material.dart';

class TourModel with ChangeNotifier {
  String? name;
  String? address;
  String? details;
  double? price;
  double? ratting;
  List<String>? imageList;
  String? id;
  String? category;

  TourModel(
      {this.name,
        this.address,
        this.details,
        this.price,
        this.imageList,
        this.ratting,
        this.id,
        this.category});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'address': address,
      'details': details,
      'price': price,
      'ratting': ratting,
      'imageList': imageList,
      'category': category
    };
  }

  /// What is Factory Class
  /// understand clearly
  factory TourModel.fromMap(Map<String, dynamic> map) {
    return TourModel(
      name: map['name'] != null ? map['name'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      ratting: map['ratting'] != null ? map['ratting'] as double : null,
      imageList: map['imageList'] != null
          ? List<String>.from(
          (map['imageList'] as List<dynamic>).map((x) => x as String))
          : null,
    );
  }
}
