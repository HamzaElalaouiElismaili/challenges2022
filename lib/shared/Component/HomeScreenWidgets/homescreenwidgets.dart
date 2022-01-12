
import 'package:flutter/material.dart';


Widget customAppBar({required void Function() menuPressed,})
{
  return SizedBox(
    height: 55,
    width: double.maxFinite,
    child: Padding(
      padding: const  EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton( icon: const Icon(Icons.menu_outlined), color: Colors.white,onPressed:menuPressed,),
          const Text("Home App"),
          const Icon(Icons.notifications,color: Colors.white,)
        ],
      ),
    ),
  );
}


Widget customBottomNavigationBar()
{
  return Padding(
    padding: const EdgeInsets.only(bottom: 6.5,left: 30,right: 30,top: 10),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            CircleAvatar(
              radius: 20,
              child: const Icon(Icons.home_filled ,size: 30, color: Colors.white ,),
              backgroundColor:Colors.redAccent[100],
               ),
            CircleAvatar(
              radius: 25,
              child: const Icon(Icons.person ,size: 30,color: Colors.white ),
               backgroundColor:Colors.redAccent[100],),
            CircleAvatar(
              radius: 20,
              child:const Icon(Icons.settings ,size: 30, color: Colors.white,),
               backgroundColor: Colors.redAccent[100],),

          ],
        ),
      ),
      height:  70,
      width: double.maxFinite,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(35),
       color: Colors.redAccent[100],
     ),
    ),
  );
}