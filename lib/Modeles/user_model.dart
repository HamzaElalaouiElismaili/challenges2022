import 'dart:io';
import 'package:challenges2022/shared/Component/constent/constent.dart';

class UserModel {
  String? fullname;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerified = false;
  String? birthday;
  String? password;
  String? address;
  File? file = File(myImage!) ;


  UserModel
      ({this.address,
    this.password,
    this.fullname,
    this.birthday,
    this.email,
    this.phone,
    this.uId,
    this.isEmailVerified,
    this.file});

  UserModel.fromJson(Map<String, dynamic> json){
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    birthday = json['birthday'];
    isEmailVerified = json['isEmailVerified'];
    address = json['address'];

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
    };
  }
}



