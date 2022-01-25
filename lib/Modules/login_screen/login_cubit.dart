import 'package:challenges2022/Modeles/user_model.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_controller_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LogInCubit extends Cubit<LoginStates> {
  LogInCubit() : super(LoginInitialState());

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  static LogInCubit get(context) => BlocProvider.of(context);

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(LoginvisiblepassState());
  }

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value)
    {
      uId = value.user!.uid;
      email = value.user!.email!;
      emit(LoginSucsessState(value.user!.uid));
    }).catchError((error)
    {
      emit(LoginErrorState(error.toString()));




      debugPrint(error.toString());
    });
  }


  void signInWithGoogle() async
  {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    emit(LoginWithGoogleLoadingState());
      FirebaseAuth.instance.signInWithCredential(credential).then((value)
    {
      User user = value.user!;
      FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((value)
      {

        debugPrint("${value.data()!}");
        emit(LoginWithGoogleSucsessState(user.uid));

      }).catchError((error)
      {
        UserModel model = UserModel(
          listFriends: [],
          address: "",
          fullname: user.displayName,
          email: user.email,
          phone: "",
          uId: user.uid,
          profileImage: "",
          birthday: "example 09/05/1998",
          isEmailVerified : false,
        );
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(model.toMap())
            .then((value)
        {

          getMyInfo(model.uId!);
          emit(CreateUserWithGoogleSingInSuccessState(model.uId!));
        }).catchError((error)
        {
          emit(CreateUserWithGoogleSingInErrorState(error.toString()));
        });

      });

    });

  }

bool isError= false;

void removeErrorBar()
{
   isError= false;
   emit(RemoveErrorBarState());
}


  void getMyInfo(String uid) {
    emit(GetMyInfoLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      debugPrint(userModel.email);
      emit(GetMyInfoSuccessfully(uid));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetMyInfoError(error.toString()));
    });
  }


}