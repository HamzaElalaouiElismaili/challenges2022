import 'dart:io';

import 'package:challenges2022/first%20month/Layouts/NoConnection/noconnection_screen.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Network/local.dart';
import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';
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
           // goBackMaybe(context);
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

                ],
              )
          );

        });


  }

}


