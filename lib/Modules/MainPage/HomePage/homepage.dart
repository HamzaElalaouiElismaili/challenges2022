import 'package:challenges2022/Modeles/user_model.dart';
import 'package:challenges2022/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/shared/Component/HomeScreenWidgets/homescreenwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../appcubit.dart';



class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     return BlocConsumer<Appcubit,Appstates>(
         listener: (context, state){},
         builder: (context,state){
           var  cubit = Appcubit.get(context);
           Size size = MediaQuery.of(context).size;
           cubit.height = size.height;
           cubit.width = size.width;
           return AnimatedPositioned(
               duration: const  Duration(milliseconds: 300),
               curve: Curves.easeInCirc,
               top: cubit.isDrawer ? 0: 0.1* cubit.height!,
               bottom:  cubit.isDrawer ? 0: 0.17* cubit.width!,
               left:  cubit.isDrawer ? 0: 0.7* cubit.width!,// this for drawer2  left:  isDrawer ? 0: 0.12* width!,
               right: cubit.isDrawer ? 0: -0.6* cubit.width!,

               child: Scaffold(
                 backgroundColor: Colors.transparent,
                 body: SafeArea(
                   child: Container(
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     decoration: BoxDecoration(
                       color: Colors.orange[100],
                       borderRadius: BorderRadius.circular(cubit.myRadius),
                     ),
                     child: Column(
                       children: [
                         customAppBar(titlePage: "Home Page",menuPressed: ()=>cubit.openDrawer()),
                         Center(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               const Text("Hi , Bro"),
                               Text("this  you're  :  ${userModel.uId}"),
                             ],
                           ),
                         ),
                         const  Spacer(),
                       ],
                     ),
                   ),
                 ),
               ),
             );


         } );
  }
}


