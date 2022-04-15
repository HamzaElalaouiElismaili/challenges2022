import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Controller/LocalizationController/localizationcontroller.dart';
import '../../shared/compontes/welcomeandverifyandpermissionwidget.dart';
import '../../shared/contsents.dart';
import '../loginscreen/loginscreen.dart';
import '../registerscreen/registerscreen.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({Key? key}) : super(key: key);
  LocalizationController localizationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    IconButton(icon: Icon(Icons.language), onPressed: ()
                    {
                      changeLangDialog(context,
                         changeToArabic: ()
                         {
                           localizationController.changLanguage(localeCode: "ar");
                           storage.write("localeGlobal", "ar");
                           Get.back();
                         },
                        changeToEn: ()
                        {
                          localizationController.changLanguage(localeCode: "en");
                          storage.write("localeGlobal", "en");
                          Get.back();

                        }
                      );
                    },),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/omr/omrassets/welcome_register_login/welcome.svg",height: MediaQuery.of(context).size.height/2-10,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("welcome".tr,style: TextStyle(fontSize: 20,height: 1,fontWeight: FontWeight.bold),),
                    Text("Bundle",style: TextStyle(height: 1.4,fontSize: 35,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontFamily: "PinyonScript"),),
                    SizedBox(height: 20,),

                    Text("introText".tr),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: loginButton(
                        textColor: Colors.white,
                          functionPressing: ()
                          {
                            storage.write("welcome", true);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
                            },
                          textButton: "createAccountNow".tr,
                          styleButton: registerButtonStyle),
                    ),
                    SizedBox(
                      width: 10
                    ),
                    Expanded(
                      child: loginButton(
                          textColor:  Color(0xff9676ff),
                          functionPressing: ()
                          {
                            storage.write("welcome", true);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                          },
                          textButton: 'login'.tr,
                          styleButton: loginButtonStyleWelcome),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20
              ),
            ],
          ),
        ),
      ),
    );
  }
}




Future changeLangDialog(context,
    {required changeToArabic,
      required changeToEn
    }) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(height: 130,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text("Arabic"),
                onTap:changeToArabic,
              ),
              ListTile(
                title: Text("English"),
                onTap: changeToEn,
              ),
            ],
          ),
        ),
        ),
      );
    },
  );
}
