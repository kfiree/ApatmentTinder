import 'package:flutter/material.dart';

class Apartment {
  String ownerId;
  String address;
  int bedroomNum;
  String photoPath;
  String bio = "";

  Apartment({
    required this.ownerId,
    required this.address,
    required this.bedroomNum,
    required this.photoPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ownerId': ownerId,
      'address': address,
      'bedroom_num': bedroomNum,
      'photo_path': photoPath,
      'bio': bio
    };
  }
}
