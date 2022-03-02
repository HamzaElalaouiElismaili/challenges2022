import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Controller/AppController/appcontroller.dart';
import '../../Controller/LocalizationController/localizationcontroller.dart';
import '../../Controller/RegisterController/registercontroller.dart';
import '../../shared/compontes/loginandregistration/loginangregistrationwidgets.dart';
import '../../shared/contsents.dart';


class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
   final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
   AppController appController = Get.find();
   LocalizationController localizationController = Get.find();

  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        builder: (registerController){
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black87,
              )),
          centerTitle: true,
          title: Text(
            "signup".tr,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.black87.withOpacity(0.0),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: registerFormKey,
                child: Column(
                  children: [
                    SvgPicture.asset('assets/omr/omrassets/welcome_register_login/register.svg',
                      height: MediaQuery.of(context).size.height /3-10,
                    ),
                    const SizedBox(height: 8),
                    Text("createAccount".tr, style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                    const SizedBox(height: 20),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                      child: myFormFieldRegister(
                          onTab: (){
                            appController.connectionStatus(context: context);
                          },
                          controller: registerController.nameController,
                          hintText: "name".tr,
                          prefixIcon: const Icon(
                            Icons.label_outline,
                            color: primaryColor,
                          ),
                          suffixIcon: const SizedBox(),
                          validate:  (String? value) {
                            if (value == null || value.isEmpty) {
                              return "emptyFailed".tr;
                            }
                          },
                          onChange: (phoneNumber) {}
                      ),
                    ),
                    const SizedBox(height: 15),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                      child: myFormFieldRegister(
                          onTab: (){
                            appController.connectionStatus(context: context);
                          },
                          controller: registerController.emailController,
                          hintText: "username".tr,
                          prefixIcon: const Icon(
                            Icons.person_sharp,
                            color: primaryColor,
                          ),
                          suffixIcon: const SizedBox(),
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "emptyFailed".tr;
                            }
                          },
                          onChange: (phoneNumber) {}

                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                      child: myFormFieldRegister(
                          onTab: (){
                            appController.connectionStatus(context: context);
                          },
                          isPass: true,
                          controller: registerController.passwordController,
                          hintText: "password".tr,
                          prefixIcon: const Icon(Icons.lock, color: primaryColor,),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black87,
                              size: 14,
                            ),
                            onPressed: () {
                              registerController.passwordController.clear();
                            },
                          ),
                          validate:   (String? value) {
                            if (value == null || value.isEmpty) {
                              return "emptyFailed".tr;
                            }
                          },
                          onChange: (phoneNumber) {}
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                      //347 line
                      child: IntlPhoneField(
                        onTap: ()
                        {
                          appController.connectionStatus(context: context);
                        },
                        onChanged: (phoneNumber)
                        {
                          // print(phone.number);
                          phone = phoneNumber.countryCode+phoneNumber.number;
                        },
                        controller: registerController.controller,
                        validator: (String? value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return "emptyFailed".tr;
                          }
                        } ,
                        decoration: InputDecoration(
                          counterText: "",
                          fillColor: Colors.white.withOpacity(0.1),
                          hintText: "phone".tr,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            borderSide: BorderSide(color: Colors.grey, width: .5),),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))),
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:  const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            child: !registerController.isLoading.value?  loginScreenButton(
                                textColor: Colors.white,
                                functionPressing: () {
                                  try
                                  {
                                    print(registerController.isLoading.value);
                                    print(phone);
                                    if(registerFormKey.currentState?.validate() != null)
                                    {
                                      registerController.isLoading.value = true;
                                      registerController.update();

                                      /*   registerController.register(context,
                                      email: registerController.emailController.text.trim().toLowerCase(),
                                      phone: phone!,
                                      password: registerController.passwordController.text,
                                      name: registerController.nameController.text.trim().toLowerCase());*/
                                      registerController.registerAPI(context,
                                          username: registerController.emailController.text.trim().toLowerCase(),
                                          phoneNumber: phone!,
                                          password: registerController.passwordController.text,
                                          name: registerController.nameController.text.trim().toLowerCase());

                                    }
                                  }catch (e)
                                  {
                                    registerController.isLoading.value = false;
                                    registerController.update();
                                    print("Error in register");
                                    print(e.toString());
                                  }
                                },
                                textButton: 'continue'.tr,
                                styleButton: loginButtonStyle):const Center(child:  CircularProgressIndicator(color: primaryColor,),),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "haveAccount".tr,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: ()
                          {
                            Get.back();
                          },
                          child: Text(
                            "login".tr,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      );
    } );
  }
}

