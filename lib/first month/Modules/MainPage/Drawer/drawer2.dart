 import 'dart:io';
import 'package:challenges2022/first%20month/Layouts/SearchLayout/searchdelegate.dart';
import 'package:challenges2022/first%20month/Layouts/Setttings/settings.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/Profile/Profile.dart';
import 'package:challenges2022/first%20month/Modules/login_screen/login_screen_ui.dart';
import 'package:challenges2022/first%20month/shared/Component/HomeScreenWidgets/homescreenwidgets.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';
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

              listTileDrawer(color: index == 0 ?Colors.black:Colors.black ,iconData:Icons.message_outlined,title: "Messages" ,onTapListTile: ()
              {
                debugPrint("Messages");
                cubit.drawerColor =0;
                cubit.drawerController();
                cubit.openDrawer();
              }),
                  listTileDrawer(color: index == 1 ?Colors.black:Colors.black,iconData:Icons.search_outlined,title: "Search" ,onTapListTile: () {
                    goTo(context,const FriendSearch());//FriendSearch  //Messages
                    cubit.drawerColor =0;
                    cubit.drawerController();
                  }),
                  listTileDrawer(color: index ==2 ?Colors.white:Colors.black,iconData:Icons.person_outlined,title: "Profile" ,onTapListTile: () {
                    goTo(context, Profile());
                    cubit.drawerColor =0;
                    cubit.drawerController();
                  }),
                  listTileDrawer(color: index ==3 ?Colors.white:Colors.black,iconData:Icons.settings_outlined,title: "Settings" ,onTapListTile: ()
                  {
                    goTo(context,  Settings());
                  }),
                  listTileDrawer(color: index ==3 ?Colors.white:Colors.black,iconData:Icons.logout_outlined,title: "Logout" ,onTapListTile: ()
                  {
                    cubit.logout();
                    goToReplace(context, LoginPage());
                  }),
                  //if(!cubit.animatedDrawer) const Spacer(),

                ],
              ),
            ),
          ),
        ),
      );

    } );
  }
}


