import 'package:challenges2022/intialscreens/Controller/LocalizationController/localizationcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Controller/AppController/appcontroller.dart';
import '../../omrmain.dart';
import '../../shared/compontes/welcomeandverifyandpermissionwidget.dart';
import '../../shared/contsents.dart';
import '../loginscreen/loginscreen.dart';

class PermissionsScreen extends StatelessWidget {
   PermissionsScreen({Key? key}) : super(key: key);
  AppController appController = Get.find();
   LocalizationController localizationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title:Text("permission".tr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),elevation: 0,backgroundColor: Colors.black87.withOpacity(0.0),
      actions: [
        TextButton(
          onPressed: ()
          {
            if(userid != 0)
            {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage(title: "Omar APP",)));
            }
            else
            {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
            }
            },
          child: Text(
            "skip".tr,
            style:TextStyle(color:primaryColor,fontSize: 16,fontWeight: FontWeight.bold,),
          ),)
      ],
      ),
      body: Column(
        children: [
          SvgPicture.asset('assets/omr/omrassets/welcome_register_login/permission.svg',
            height: MediaQuery.of(context).size.height /2-10,
          ),
          Text('permissionLine1'.tr, style: TextStyle(color: Colors.black87,height: 1,fontSize: 15,fontWeight: FontWeight.bold),),
          Text('permissionLine2'.tr,style: TextStyle(color: Colors.black87,height: 1.6,fontSize: 15,fontWeight: FontWeight.bold),),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                loginButton(
                    textColor: Colors.white,
                    functionPressing: ()
                    {
                      storage.write("permission", true);

                      if((userid != 0))
                      {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));

                      }else
                      {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage(title: "Omar APP",)));
                      }

                      },
                    textButton: "permission".tr,
                    styleButton: registerButtonStyle),
                SizedBox(height: 19,),
                loginButton(
                    textColor: primaryColor,
                    functionPressing: ()
                    {
                      if(userid != 0)
                      {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage(title: "Omar APP",)));
                      }
                      else
                      {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));

                      }
                    },
                    textButton: "skip".tr,
                    styleButton: loginButtonStyleWelcome),
                SizedBox(height: 15),
              ],
            ),
          ),

        ],
      ),
    );
  }
}