 import 'dart:io';
import 'package:challenges2022/Layouts/MessageLayout/messages_main_screen.dart';
import 'package:challenges2022/Modeles/user_model.dart';
import 'package:challenges2022/Modules/Profile_screen/profile_ui.dart';
import 'package:challenges2022/Modules/login_screen/login_screen_ui.dart';
import 'package:challenges2022/Network/local.dart';
import 'package:challenges2022/shared/Component/HomeScreenWidgets/homescreenwidgets.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../appcubit.dart';
import '../main_cubit_controller.dart';

class DrawerPage2 extends StatelessWidget {
  final  File myPicture;
  final  int index;

  const DrawerPage2({Key? key, required this.myPicture,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,state) {},
        builder: (context,state)
    {
      var cubit = Appcubit.get(context);
      return  Padding(
        padding:  EdgeInsets.all(cubit.drawer2Padding),
        child: Align(
          alignment:Alignment.bottomLeft,
          child: GestureDetector(
           onTap: ()=> cubit.animationDrawer(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
               color:  Colors.indigo.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(cubit.drawer2Padding)
              ),
              height: cubit.animatedDrawer ? MediaQuery.of(context).size.height :  MediaQuery.of(context).size.height-190 ,
              width: cubit.animatedDrawer ? MediaQuery.of(context).size.width :  MediaQuery.of(context).size.width-150 ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage:  userModel.profileImage == imageProfileDefault ? FileImage(myPicture ,scale: 0.5 ): NetworkImage(userModel.profileImage!) as ImageProvider<Object>?,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "${userModel.fullname}",overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "${userModel.address}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                          height: 1),
                    ),
                  ),

              listTileDrawer(color: index ==0 ?Colors.white:Colors.black ,iconData:Icons.dashboard_outlined,title: "Dashboard" ,onTapListTile: ()
              {

                debugPrint("Dashboard");
                cubit.drawerColor =0;
                cubit.drawerController();
              }),
                  listTileDrawer(color: index == 1 ?Colors.white:Colors.black,iconData:Icons.message_outlined,title: "Messages" ,onTapListTile: () {
                    debugPrint("Dashboard");
                    cubit.drawerColor = 1;
                    cubit.widget = Messages(index:  cubit.drawerColor ,appbar: Container(color: Colors.black,),);
                    cubit.drawerController();
                  }),
                  listTileDrawer(color: index ==2 ?Colors.white:Colors.black,iconData:Icons.today_outlined,title: "Calendar" ,onTapListTile: () {
                    debugPrint("Dashboard");
                    cubit.drawerColor =2;
                    cubit.drawerController();
                  }),
                  listTileDrawer(color: index ==3 ?Colors.white:Colors.black,iconData:Icons.lock_outline,title: "Privacy" ,onTapListTile: () {
                    debugPrint("Dashboard");
                    cubit.drawerColor =3;
                    cubit.drawerController();

                  }),
                  listTileDrawer(color: index ==4 ?Colors.white:Colors.black,iconData:Icons.person_outlined,title: "Profile" ,onTapListTile: () {
                    goTo(context, Profile());
                    cubit.drawerColor =0;
                    cubit.drawerController();
                  }),
                  //if(!cubit.animatedDrawer) const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                    [
                      listTileDrawer2(iconData:Icons.settings_outlined,title: "Settings" ,onTapListTile: ()=> debugPrint("Settings")),
                      Container(height: 20,width: 5, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black,width: 1)),),
                      listTileDrawer2(iconData:Icons.logout_outlined,title: "Logout" ,onTapListTile: ()
                     async
                     {
                        await FirebaseAuth.instance.signOut();
                        CashLocal.removeData(key: "uid");
                        goToReplace(context, LoginPage());

                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

    } );
  }
}


