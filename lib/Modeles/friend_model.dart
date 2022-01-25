

import 'dart:io';
import 'package:challenges2022/shared/Component/constent/constent.dart';

class FriendModel {
  String? fullname;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerified = false;
  String? birthday;
  String? address;
  String? profileImage ="";
  List? listFriends = [];


  FriendModel({this.address,
    this.fullname,
    this.birthday,
    this.email,
    this.phone,
    this.uId,
    this.isEmailVerified,
    this.profileImage,
    this.listFriends,});

  FriendModel.fromJson(Map<String, dynamic> json){
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    birthday = json['birthday'];
    isEmailVerified = json['isEmailVerified'];
    address = json['address'];
    profileImage = json['profileImage'];
    listFriends= json['listFriends'];

  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'uId': uId,
      'email': email,
      'phone': phone,
      'isEmailVerified': isEmailVerified,
      'birthday': birthday,
      'address' : address,
      'profileImage' : profileImage,
      'listFriends' : listFriends,

    };
  }
}

FriendModel friendModel = FriendModel();