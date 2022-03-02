
import 'package:challenges2022/first%20month/Layouts/Following/following_ui.dart';
import 'package:challenges2022/first%20month/Layouts/Profile_screen/profile_ui.dart';
import 'package:challenges2022/first%20month/Layouts/QR/mypageqr.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/first%20month/shared/ClipPath/clippath_profile.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';
import 'package:challenges2022/first%20month/shared/Component/loginAndregisterWidgets/loginandregisterwidgets.dart';
import 'package:challenges2022/first%20month/shared/Styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return Scaffold(
            body: SafeArea(child: Column(
              children:
              [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: ClipPath(
                        clipper: ClipPathClass(),
                        child: Container(
                          color: Colors.indigoAccent[100],
                          width: MediaQuery.of(context).size.width+30,
                          height:  MediaQuery.of(context).size.width/1.1-25,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ClipPath(
                        clipper: ClipPathClass(),
                        child: SizedBox(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.width/1.2,
                          child:  userModel.profileImage == imageProfileDefault ? Image.file(userModel.file! ,scale: 0.5, fit: BoxFit.cover, ): Image.network(userModel.profileImage!, fit: BoxFit.cover) ,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(userModel.fullname!),
                    Text(userModel.email!),
                    Text(userModel.phone!),
                  ],
                ),
                SizedBox(
                  height: 116,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Card(color:Colors.indigoAccent[100],child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("${userModel.listFriends!.length}"),
                              const Text("Followers"),
                            ],
                          ),
                        ),),


                        InkWell(
                          onTap: ()
                          {
                            goTo(context,const FollowingList());
                          },
                          child: Card(color:Colors.indigoAccent[100],child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("${userModel.followers!.length}"),
                                const Text("Following"),

                              ],
                            ),
                          ),),
                        ),

                        InkWell(
                          onTap: ()
                          {
                            goTo(context, MyQrCreator(id:userModel.uId!,));
                          },
                          child: Card(color:Colors.indigoAccent[100],child: const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child:  SizedBox( height: 50,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.qr_code ,size: 30,),
                              ),
                             ),
                          ),),
                        ),

                      ],
                    ),
                  ),
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: loginButton(
                      textButton: "Edit Profile",
                      functionPressing: ()
                      {
                        goTo(context, ProfileSetting());
                      },
                      styleButton: loginButtonStyle),
                ),

              ],
            ),),
          );
        }
        );
  }
}


