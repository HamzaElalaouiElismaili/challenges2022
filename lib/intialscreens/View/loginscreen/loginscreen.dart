import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/AppController/appcontroller.dart';
import '../../Controller/LocalizationController/localizationcontroller.dart';
import '../../shared/compontes/loginandregistration/loginangregistrationwidgets.dart';
import '../../shared/contsents.dart';
import '../registerscreen/registerscreen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  AppController appController = Get.find();
   final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
   LocalizationController localizationController = Get.find();


  @override
  Widget build(BuildContext context)
  {
    return GetBuilder<AppController>(builder: (appController)
        {
          return  Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  )),
              centerTitle: true,
              title: Text(
                "login".tr,
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
              elevation: 0,
              backgroundColor: Colors.black87.withOpacity(0.0),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/omr/omrassets/welcome_register_login/login.svg',
                          height: MediaQuery.of(context).size.height / 2 - 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("loginTo".tr, style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                        const SizedBox(height: 25,),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: myFormFieldLogin(
                              ontab: (){
                                appController.connectionStatus(context: context);
                              },
                              controller: appController.emailController,
                              hintText: "username".tr,
                              prefixIcon: const Icon(
                                Icons.person_sharp,
                                color: Color(0xff9676ff),
                              ),
                              suffixIcon: const SizedBox(),
                              validate: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "emptyFailed".tr;
                                }
                              },
                              onChange: (phoneNumber) {}),

                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: myFormFieldLogin(
                              ontab: (){
                                appController.connectionStatus(context: context);
                              },
                              isPass: true,
                              controller: appController.passwordController,
                              hintText: "password".tr,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color:  Color(0xff9676ff),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.black87,
                                  size: 14,
                                ),
                                onPressed: ()
                                {
                                  appController.passwordController.clear();
                                },
                              ),
                              validate: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "emptyFailed".tr;
                                }
                              },
                              onChange: (phoneNumber) {}),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 5),
                                child: !appController.loadingLogin.value?  loginScreenButton(
                                    textColor: Colors.white,
                                    functionPressing: ()
                                    {
                                      print(appController.loadingLogin);

                                      if (loginFormKey.currentState?.validate() != null)
                                      {
                                        appController.loadingLogin.value = true;
                                        appController.update();
                                        print(appController.loadingLogin);
                                       /* appController.userLogin(context,
                                            email: appController.emailController.text.trim().toLowerCase(),
                                            password: appController.passwordController.text);*/

                                        appController.loginAPI(context,
                                            username: appController.emailController.text.trim().toLowerCase(),
                                            password: appController.passwordController.text);

                                      }
                                    },
                                    textButton: 'login'.tr,
                                    styleButton: loginButtonStyle):const Center(child:  CircularProgressIndicator(color: primaryColor,),),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "noAccount".tr,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                                },
                                child: Text(
                                  "signup".tr,
                                  style: const TextStyle(
                                      color: Color(0xff9676ff),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}




Future  bottomSheetModel({required BuildContext context,required Widget child})
{
  final theme = Theme.of(context);
  return showModalBottomSheet<int>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.all(16.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.indigoAccent.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment : MainAxisAlignment.center,
          children:
          [
            Container(height: 50,child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: child,
            ),)
          ],
        ),
      );
    },
  );
}