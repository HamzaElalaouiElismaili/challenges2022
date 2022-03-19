
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../Model/UserModel/userModel.dart';
import '../../View/Permission/permissionscreen.dart';
import '../../View/loginscreen/loginscreen.dart';
import '../../database/database.dart';
import '../../omrmain.dart';
import '../../shared/contsents.dart';
import '../LocalizationController/localizationcontroller.dart';

LocalizationController localizationController = Get.find();



class AppController extends GetxController
{
  var loadingLogin = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var stateError ;

  connectionStatus({required BuildContext context}) async{

     var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none)
    {
      bottomSheetModel(context: context, child: Text("noNetwork".tr,style: TextStyle(color: Colors.white),));
    }

  }


  void userLogin(context,{
    required String email,
    required String password,
  }) {

    auth.signInWithEmailAndPassword(email: email, password: password).then((value)
    {
      uId = value.user!.uid;
      storage.write("uid", uId);
      email = value.user!.email!;
      getMyInfo(uid:value.user!.uid);

      if (permission == false)
      {
        Get.offAll(()=>PermissionsScreen());
        emailController.clear();
        passwordController.clear();
      }
      else
      {
     //   scaffoldKey.currentState!.showSnackBar(SnackBar(backgroundColor:primaryColor,content: Text("login Se"),));
        Get.offAll(()=>MyHomePage(title: 'Omar APP',));
        emailController.clear();
        passwordController.clear();
      }
   // scaffoldKey.currentState!.showSnackBar(SnackBar(backgroundColor:primaryColor,content: Text("login Successfully"),));

    }).catchError((stateError)
    {
      loadingLogin.value = false;
      update();
      print(stateError.toString());

      if(stateError.toString() == errorPasswordWrong)
      {
        errorType ="passwordIncorrect".tr;
      }
      else if(stateError.toString() == errorEmailFormat)
      {
        errorType = "notEmail".tr;
      }
      else if(stateError.toString() == errorUserNotFound )
      {
        errorType ="notAccount".tr;
      }
      else if(stateError.toString() == errorNetworkFailed)
      {
        errorType ="noNetwork".tr;
      }
      else if(stateError.toString() == errorDataEmpty)
      {
        errorType ="noDataEntered".tr;
      }
      else if(stateError.toString() == errorEmailUsed)
      {
        errorType ="emailExist".tr;
      }
      else
      {
        errorType = "TryAgain".tr;
      }

      bottomSheetModel(context: context, child: Text(errorType, style: TextStyle(color: Colors.white),));

    });
  }

  void loginAPI(context,{
    required String username,
    required String password,
  })
  {
    AppDataBase().login(username: username, password: password).then((value)
    {
      if(value == "LoginDone")
      {
        print("Login Dane");
        storage.write("uid", userid);
        errorType ="loginsuccessfully".tr;
        bottomSheetModel(context: context, child: Text(errorType, style: TextStyle(color: Colors.white),));
        if (permission == false)
        {
          Get.offAll(()=>PermissionsScreen());
          emailController.clear();
          passwordController.clear();
        }
        else
        {
          Get.offAll(()=> MyHomePage(title: 'Omar APP',));
          emailController.clear();
          passwordController.clear();
        }

      }
      else if( value =="PasswordNotCorrect")
      {
        print("Password Not Correct");
        errorType ="passwordIncorrect".tr;
        bottomSheetModel(context: context, child: Text(errorType, style: TextStyle(color: Colors.white),));
      }
      else if( value == "LoginFailed")
      {
        print("Login Failed");
      }
      else if( value =="NotRegister")
      {
        errorType ="notAccount".tr;
        bottomSheetModel(context: context, child: Text(errorType, style: TextStyle(color: Colors.white),));
        print("Not Register");
      }
      else
      {
        print(" Error Cached ");
      }
      loadingLogin.value = false;
      update();
    }).catchError((stateError)
    {
      loadingLogin.value = false;
      update();
      print(" Error Cached ");
      print(stateError.toString());
    });
  }

   getMyInfo({required String uid}) async
   {
    final  getData = await fireStore.collection('users').doc(uid).get();
    try{
      userModel = UserModel.fromJson(getData.data()!);
      debugPrint(userModel.email);
      update();
    }
    catch (e)
    {
      debugPrint(e.toString());
      Get.snackbar("error",'Error GetData Please try aging' );

      update();
    }
  }

  logout() async{
   await FirebaseAuth.instance.signOut();
   storage.remove("uid");
   storage.remove("userid");
   Get.offAll(()=>LoginScreen());

  }

}