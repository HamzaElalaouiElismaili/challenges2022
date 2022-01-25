import 'dart:io';
import 'package:challenges2022/Layouts/ClanderLayout/clander.dart';
import 'package:challenges2022/Layouts/MessageLayout/messages_main_screen.dart';
import 'package:challenges2022/Layouts/NoConnection/noconnection_screen.dart';
import 'package:challenges2022/Layouts/Privacy/privacy_layout.dart';
import 'package:challenges2022/Modeles/user_model.dart';
import 'package:challenges2022/Network/local.dart';
import 'package:challenges2022/shared/Component/HomeScreenWidgets/homescreenwidgets.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Drawer/drawer2.dart';
import 'HomePage/homepage.dart';
import 'appcubit.dart';
import 'main_cubit_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  double height  = 0;
  double width  = 0;
  @override
  Widget build(BuildContext context) {
    myImage = CashLocal.getData(key: 'myimage');
    userModel.file = File(myImage!);
    return  BlocConsumer<Appcubit,Appstates>(
        listener: (context,state)
        {
          if (state is Appinitialstate) {}
          if (state is UpdateSuccessflly)
          {
            goBackMaybe(context);
          }
        },
        builder:(context,state)
        {
          Size size = MediaQuery.of(context).size;
          height = size.height;
          width = size.width;
          var cubit = Appcubit.get(context);

          return  Scaffold(
              body: (state is GetMyInfoLoading) ? const Center(child:NoConnection(),) :Stack(
                children:
                [
                  Scaffold(body:Image.asset("assets/images/test.png",fit: BoxFit.fitHeight),),

                SingleChildScrollView(physics: const BouncingScrollPhysics(),child: SafeArea(bottom: true,child: DrawerPage2(myPicture: userModel.file!,index: cubit.drawerColor,))),

                   // DrawerPage(),
                  if (cubit.drawerColor == 0)
                    Visibility(child: HomePage(),visible:cubit.isVisibleHomePage ,),
                  if (cubit.drawerColor == 1)
                    Visibility(child:  Messages(index: cubit.drawerColor ,appbar: customAppBar(titlePage: "Messages",menuPressed: ()
                    {
                      cubit.drawerColor = 0;
                      cubit.drawerController();

                    }),),visible:cubit.isVisibleHomePage ,),
                  if (cubit.drawerColor == 2)
                    Visibility(child:  Calender(appbar: customAppBar(titlePage: "Messages",menuPressed: ()
                    {
                      cubit.drawerColor = 0;
                      cubit.drawerController();

                    }),),visible:cubit.isVisibleHomePage ,),
                  if (cubit.drawerColor == 3)
                    Visibility(child:  Privacy(appbar: customAppBar(titlePage: "Messages",menuPressed: ()
                    {
                      cubit.drawerColor = 0;
                      cubit.drawerController();
                    }),),visible:cubit.isVisibleHomePage ,),


                ],
              )
          );

        });


  }

}


