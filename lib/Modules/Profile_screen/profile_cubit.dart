import 'dart:io';
import 'package:challenges2022/Modules/Profile_screen/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(Appinitialstate());

  static ProfileCubit get(context) => BlocProvider.of(context);


}