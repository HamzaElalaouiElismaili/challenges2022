import 'package:challenges2022/mydevkit/mydevkit.dart';
import 'package:challenges2022/second_month/bookingstates.dart';
import 'package:challenges2022/second_month/cubitbooking.dart';
import 'package:challenges2022/second_month/main_booking.dart';
import 'package:challenges2022/walletweb/walletweb.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:camera/camera.dart';


Future<void> main() async {


  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  MyApp ({Key? key, }) : super(key: key);


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
                home:  MainBooking(),// const  WalletAppMain(),//WalletAppMain ListAnimation()  // const AnimationMonth(),
              );
            })
    );
  }
}
