import 'dart:io';
import 'package:challenges2022/Modeles/user_model.dart';
import 'package:challenges2022/Network/local.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'HomePage/homepage.dart';
import 'main_cubit_controller.dart';

class Appcubit extends Cubit<Appstates> {


  Appcubit() : super(Appinitialstate());

  static Appcubit get(context) => BlocProvider.of(context);

  double? height;
  double? width ;
  double myRadius = 0;
  bool isDrawer = true;
  bool animatedDrawer = false ;
  bool isVisibleHomePage = true ;
  int drawerColor = 0;
  Widget widget =  HomePage();
  var image  = userModel.file;
  var picker = ImagePicker();
  File? profileImage;
  double drawer2Padding = 20.0;
  Locale? localeApp = const Locale("fr" ,"");









  void languageChange({Locale? locale}) {
    if(locale == const Locale("ar",""))
    {
      localeApp = const Locale("ar","");
      emit(LanguageChangedArabic());
    }
    if(locale == const Locale("fr",""))
    {
      localeApp = const Locale("fr","");
      emit(LanguageChangedFrance());

    }



  }

  void getMyInfo()
  {
    emit(GetMyInfoLoading());
    FirebaseFirestore
        .instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value)
    {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetMyInfoSuccessfully());
    }).catchError((error)
    {

      print(error.toString());
      emit(GetMyInfoError(error.toString()));

    });

  }


  void emitAndGetInfo()
  {
    getMyInfo();
    emit(EmitAndGetMyInfo());
  }

  void openDrawer() {
        isDrawer = !isDrawer;
        if (isDrawer==false) {myRadius = 20;}
        else {myRadius = 0;}

    emit(OpenDrawerState());
  }


  drawerController() {
    emit(ChangeDrawer());
  }


  void  animationDrawer() {

    if(animatedDrawer == false )
    {
      drawer2Padding = 0;
      isVisibleHomePage = false;
    } else
      {
        drawer2Padding = 20;
        isVisibleHomePage = true;
      }

    animatedDrawer = !animatedDrawer;

    emit(AnimationDrawer());
  }




  update({
    required String upemail,
    required String upphone,
    required String upbirthDay,
    required String upfullname,
    required String upaddr,
    required String profileImage,
    required List listFriends

  }) {
    UserModel model = UserModel(
        fullname: upfullname,
        birthday: upbirthDay,
        email: upemail,
        phone: upphone,
        uId: userModel.uId,
        address: upaddr,
        listFriends: listFriends ,
        profileImage: profileImage,
        isEmailVerified: userModel.isEmailVerified);

    emit(UpdateLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value)
    {
      userModel.file = File(CashLocal.getData(key: "myimage"));
      emit(UpdateSuccessflly());

    }).catchError((error)
    {
      emit(UpdateError(error.toString()));
    });
  }


  Future<void> getCoverImage() async
  {
    emit(CoverImagePicckedLoadingState());

     picker.pickImage(source: ImageSource.gallery).then((value)
     {

       if (value != null)
       {
         profileImage = File(value.path);
         CashLocal.saveData(key: 'myimage', value: profileImage!.path);
         userModel.file = profileImage;
         test2 = profileImage;
         print(value.path);
         emit(CoverImagePicckedSuccessState(profileImage!));
       } else {
         print('No image selected.');
         emit(CoverImagePicckedErrorState());
       }

     });

  }


  void uploadProfileImage({
    required String? name,
    required String? email,
    required String? phone,
    required String? upbirthDay,
    required String? upaddr,
  }) {
    emit(UploadingLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${userModel.uId}/${Uri.file(test2!.path).pathSegments.last}')
        .putFile(test2!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
         debugPrint(value);
         update(listFriends: userModel.listFriends!,upemail: email!, upfullname: name!, upbirthDay: upbirthDay!, upphone: phone!, upaddr: upaddr! ,profileImage : value);
         emit(ProfileImageUploadSuccessState());
      }).catchError((error) {
        emit(ProfileImageUploadErrorState());
      });
    }).catchError((error) {
      emit(ProfileImageUploadErrorState());
    });
  }

}


bool? continer;