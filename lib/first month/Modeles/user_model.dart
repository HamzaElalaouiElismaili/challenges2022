import 'dart:io';

import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';

class UserModel {
  String? fullname;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerified = false;
  String? birthday;
  String? password;
  String? address;
  String? profileImage ="";
  List? listFriends = [];
  List?  followers = [];
  File? file = File(myImage!);
  String? bio = "";
  String? token  = "";


  UserModel({this.address,
    this.password,
    this.fullname,
    this.birthday,
    this.email,
    this.phone,
    this.uId,
    this.isEmailVerified,
    this.profileImage,
    this.listFriends,
    this.followers,
    this.bio,
    this.file,
    this.token});

  UserModel.fromJson(Map<String, dynamic> json){
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    birthday = json['birthday'];
    isEmailVerified = json['isEmailVerified'];
    address = json['address'];
    profileImage = json['profileImage'];
    listFriends= json['listFriends'];
    followers= json['followers'];
    bio= json['bio'];
    token= json['token'];

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
      'followers' : followers,
      'bio' : bio,
      'token' : token,

    };
  }

}

UserModel userModel = UserModel();
