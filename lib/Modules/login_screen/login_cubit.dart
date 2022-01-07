import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_controller_state.dart';

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
    emit(LoginSucsessState(""));

  }


}