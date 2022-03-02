import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/register_screen/register_states.dart';
import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(RegistervisiblepassState());
  }

  void register({
    required String? fullname,
    required String? birthday,
    required String? email,
    required String? phone,
    required String? password,
    required String? profileImage,
    required List? listFriends,
    required List? followers,
    required String? token

  })
  {

    emit(RegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!,).then((value)
    {
      uId = value.user!.uid;
      createUser(token: token,bio:"",followers:followers,listFriends: listFriends,profileImage: profileImage,password: password,fullname: fullname, email: email, phone: phone, uId: value.user!.uid, birthday:birthday);
    }).catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
    });


  }


  void createUser({
    required String? fullname,
    required String? email,
    required String? phone,
    required String? uId,
    required String? birthday,
    required String? password,
    required String? profileImage,
    required List? listFriends,
    required List? followers,
    required String? bio,
    required String? token,



  }) {
    UserModel model = UserModel(
      address: "",
      password: password,
      fullname: fullname,
      email: email,
      phone: phone,
      bio: bio,
      uId: uId,
      token: token,
      birthday: birthday,
      profileImage: profileImage,
      listFriends: [],
      followers: [],
      isEmailVerified : false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState(model.uId!));
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }


  bool isError = false;

  void removeErrorBar()
  {
    isError= false;
    emit(RegistrationRemoveErrorBarState());

  }

}