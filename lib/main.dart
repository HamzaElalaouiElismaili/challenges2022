// lib/first month/main_chat_app/main_chat_app.dart
//
// lib/intialscreens/omrmain.dart

import 'package:challenges2022/second_month/bookingstates.dart';
import 'package:challenges2022/second_month/cubitbooking.dart';
import 'package:challenges2022/second_month/main_booking.dart';
import 'package:challenges2022/second_month/ram.dart';
import 'package:challenges2022/walletweb/walletweb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animationMonth/listanimation.dart';
import 'mydevkit/mydevkit.dart';
import 'mydevkit/screens/ContactUs/contactus1.dart';

 void main()
 {

     runApp(const MyApp());
}



class MyApp extends StatelessWidget
{
   const MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {

    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context)=> BookingAppCubit()),
        ],
        child: BlocConsumer<BookingAppCubit,BookingAppStates>(
            listener: (context,state){},
            builder:(context,state)
            {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Challenges 2022',
                theme: ThemeData(
                  fontFamily: "Cairo",
                  primarySwatch: Colors.indigo,
                ),
                home:  ListDevKit(),// const  WalletAppMain(),//WalletAppMain ListAnimation()  // const AnimationMonth(),

              );

            })

    );

  }
}



