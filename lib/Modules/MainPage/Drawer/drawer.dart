
import 'package:challenges2022/Modeles/user_model.dart';
import 'package:challenges2022/Modules/Profile_screen/profile_ui.dart';
import 'package:challenges2022/shared/Component/HomeScreenWidgets/homescreenwidgets.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../appcubit.dart';
import '../main_cubit_controller.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
       listener : (context,state){},
       builder : (context,state)
       {
        return Padding(
          padding: const EdgeInsets.only(left: 0.2 ,right: 0.2 ),
          child: Align(
            alignment:Alignment.centerLeft,
            child: Container(
              color:  Colors.indigo[100],
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width-150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Row(
                    children:  [
                      Padding(
                        padding: const  EdgeInsets.symmetric(horizontal: 13,vertical: 15),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          backgroundImage: FileImage(userModel.file!, scale: 0.5 )  ,

                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2- 40,
                        child:  Text(
                          "Hi , ${userModel.fullname}",overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15,),
                  Expanded(child: drawerNavigation(iconData: Icons.dashboard, colorText: Colors.black, text: "Dashboard", backgroundColor: Colors.transparent,onTap: (){})),
                  Expanded(child: drawerNavigation(iconData: Icons.message, colorText: Colors.black, text: "Messages", backgroundColor: Colors.transparent,onTap: (){})),
                  Expanded(child: drawerNavigation(iconData: Icons.today_outlined, colorText: Colors.black, text: "Calendar", backgroundColor: Colors.transparent,onTap: (){})),
                 // Expanded(child: drawerNavigation(iconData: Icons.lock, colorText: Colors.black, text: "Privacy", backgroundColor: Colors.transparent,onTap: ()=>goTo(context, Profile()))),
                  const Spacer(),
                  const ListTile(
                    leading:  Icon(Icons.logout),
                    title:  Text("Logout"),
                  ),
                ],
              ),
            ),
          ),
        );
       });
  }


}

