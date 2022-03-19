import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/UserModel/userModel.dart';
import '../../View/Permission/permissionscreen.dart';
import '../../View/loginscreen/loginscreen.dart';
import '../../View/phoneverification/phoneverification.dart';
import '../../database/database.dart';
import '../../shared/contsents.dart';
import '../LocalizationController/localizationcontroller.dart';

LocalizationController localizationController = Get.find();

class RegisterController extends GetxController
{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();
  final TextEditingController num5 = TextEditingController();
  final TextEditingController num6 = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var authState = ''.obs;
  String verificationId = "";
  var isLoading = false.obs;


  void register(context,{
    required String? name,
    required String? email,
    required String? phone,
    required String? password,
  })

  {
    auth.createUserWithEmailAndPassword(email: email!, password: password!).then((value)
    {

      phoneVerification(phone: phone! );

      uId = value.user!.uid;
      createUser(password: password,name:name, email: email, phone: phone, uId: value.user!.uid,);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PhoneVerification(phone: phone,)));

      emailController.clear();
      passwordController.clear();
      phoneController.clear();
      controller.clear();
      nameController.clear();
      update();
    }).catchError((stateError)
    {

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

      print('Error in registration');
      update();

    });
  }

  void registerAPI(context,{
    required String name,
    required String username,
    required String phoneNumber,
    required String password,
  })
  {
    print("reg");
    AppDataBase().registration(username: username, phone: phoneNumber, name: name, password: password).then((value)
    {
      if(value == "AlreadyRegister")
      {
        print("User Already Register");
        errorType ="emailExist".tr;
        bottomSheetModel(context: context, child: Text(errorType, style: TextStyle(color: Colors.white),));
      }
      else if( value =="Register")
      {
        phoneVerification(phone: phoneNumber);
        errorType ="registersuccessfully".tr;
        bottomSheetModel(context: context, child: Text(errorType, style: TextStyle(color: Colors.white),));
        print("Registration Dane");
        emailController.clear();
        passwordController.clear();
        phoneController.clear();
        controller.clear();
        nameController.clear();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PhoneVerification(phone: phoneNumber,)));
        update();

      }
      else if( value =="NotRegister")
      {
        errorType ="errorinregister".tr;
        bottomSheetModel(context: context, child: Text(errorType, style: TextStyle(color: Colors.white),));
        print("Registration Failed");
      }
      else
      {
        print(" Error Cached ");
      }

      isLoading.value = false;
      update();

    }).catchError((onError)
    {
      print(" Error Cached ");
      print(onError.toString());
      isLoading.value = false;
      update();
    });
  }

  void createUser({
    required String? name,
    required String? email,
    required String? phone,
    required String? uId,
    required String? password,

  }) {
    UserModel model = UserModel(
      password: password,
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isEmailVerified : false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value)
    {
      update();
      print("firestore");
    }).catchError((error)
    {
      print('error in registration Firestore');
      update();
    });
  }

  phoneVerification({required String phone}) async{
    print("send verification phone");
    await auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential authCredential)  {},
        verificationFailed: (authException)
        {

          Get.snackbar("error",'Error Please try aging' );
          print('Error Please try aging');
        },
        codeSent: (String id, [int? resendToken])
        {
          this.verificationId =id;
          authState.value = 'login good';
        },
        codeAutoRetrievalTimeout:(String verificationID)
        {
          this.verificationId = verificationID;
        }
    );
  }

  verifyOTP({required BuildContext context}) async {

    if(num1.text.isNotEmpty && num2.text.isNotEmpty && num3.text.isNotEmpty &&num4.text.isNotEmpty &&num5.text.isNotEmpty && num6.text.isNotEmpty ) {
      String otp = num1.text + num2.text + num3.text + num4.text + num5.text + num6.text;
      auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: this.verificationId, smsCode: otp)).then((value) async
      {
        if(value.user != null)
        {
          if(!permission)
          {
            await bottomSheetModel(context: context, child: Text("phoneverified".tr, style: TextStyle(color: Colors.white),));
            Get.offAll(() => PermissionsScreen());
          }
          else
          {
            await bottomSheetModel(context: context, child: Text("phoneverified".tr, style: TextStyle(color: Colors.white),));
            Get.offAll(() => LoginScreen());
          }
          num1.clear();
          num2.clear();
          num3.clear();
          num4.clear();
          num5.clear();
          num6.clear();
        }
        else
        {
          print("pass code error");
          await bottomSheetModel(context: context, child: Text("TryAgain".tr, style: TextStyle(color: Colors.white),));
         // Get.snackbar("error", 'Error Please try aging');
        }

      }).catchError((e)
      {
        if(e.toString() == phoneVerificationExpired)
        {
          print("The sms code has expired");
          bottomSheetModel(context: context, child: Text("smscodeexpired".tr, style: TextStyle(color: Colors.white),));

      }
        else if (e.toString() == phoneVerificationInvalid)
        {
          print("The sms verification code invalid ");
          bottomSheetModel(context: context, child: Text("codeinvalid".tr, style: TextStyle(color: Colors.white),));
        }
        else
        {
          print("Phone verification Error");
           bottomSheetModel(context: context, child: Text("TryAgain".tr, style: TextStyle(color: Colors.white),));

      }
      });

    }
    else
    {
      bottomSheetModel(context: context, child: Text("TryAgain".tr, style: TextStyle(color: Colors.white),));
      Get.snackbar("Error", 'Error Please Fill Inputs');
    }
  }

}

