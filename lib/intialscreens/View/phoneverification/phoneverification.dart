import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/LocalizationController/localizationcontroller.dart';
import '../../Controller/RegisterController/registercontroller.dart';
import '../../shared/compontes/welcomeandverifyandpermissionwidget.dart';
import '../../shared/contsents.dart';

class PhoneVerification extends StatelessWidget {
  final String phone;
  PhoneVerification({Key? key,required this.phone}) : super(key: key);
  RegisterController registerController = Get.find();
  LocalizationController localizationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        builder: (registerController)
        {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {Navigator.of(context).pop();},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  )),
              centerTitle: true,
              title: Text(
                "verifyCode".tr,
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
              elevation: 0,
              backgroundColor: Colors.black87.withOpacity(0.0),
            ),
            body: Column(
              children:
              [
                Expanded(child: SvgPicture.asset('assets/omr/omrassets/welcome_register_login/verify.svg', height: MediaQuery.of(context).size.height /2-80,)),
                const SizedBox(height: 11),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center ,
                  children: [
                    Text("codeWeSent".tr),
                    Text(phone,style: const TextStyle(color: primaryColor,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 11),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      numberTextField(context: context,controller:registerController.num1 , first: true,last: false),
                      const SizedBox(width: 10,),
                      numberTextField(context: context,controller:registerController.num2,first: false,last: false),

                      const SizedBox(width: 10,),
                      numberTextField(context: context,controller:registerController.num3,first: false,last: false),

                      const SizedBox(width: 10,),
                      numberTextField(context: context,controller:registerController.num4,first: false,last: false),

                      const SizedBox(width: 10,),
                      numberTextField(context: context,controller:registerController.num5,first: false,last: false),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          controller: registerController.num6,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textInputAction: TextInputAction.done,
                          showCursor: false,
                          readOnly: false,
                          onSubmitted: (value)
                          {
                            registerController.verifyOTP(context: context);
                          },
                          decoration: const InputDecoration(counterText: "",hintText: "#"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center ,
                  children: [
                    Text("notReceiveCode".tr),
                    TextButton(child:Text("resendCode".tr,style: const TextStyle(color: primaryColor,fontWeight: FontWeight.bold),),
                      onPressed: ()
                      {
                        registerController.phoneVerification(phone: phone);
                      },
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextButton(onPressed: ()
                    {
                      registerController.verifyOTP(context: context);
                    }, child: Text("continue".tr)),
                )
              ],
            ),
          );
        }
    );
  }


}

