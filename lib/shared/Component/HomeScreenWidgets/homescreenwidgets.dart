
import 'package:flutter/material.dart';


Widget customAppBar({required void Function() menuPressed,required String titlePage})
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
          IconButton( icon: const Icon(Icons.menu), color: Colors.white,onPressed:menuPressed,),
           Text(titlePage),
          const Icon(Icons.notifications,color: Colors.white,)
        ],
      ),
    ),
  );
}


Widget customBottomNavigationBar({required void Function() onTapProfile})
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
            GestureDetector(
              onTap: onTapProfile,
              child: CircleAvatar(
                radius: 25,
                child: const Icon(Icons.person ,size: 30,color: Colors.white ),
                 backgroundColor:Colors.redAccent[100],),
            ),
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






Widget drawerNavigation({required String text,required Color colorText, required IconData iconData ,required Color backgroundColor,required Function() onTap})
{
  return  GestureDetector(
    onTap: onTap,
    child: Container(
      child: RotatedBox(quarterTurns: 3,child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Expanded(child: Text(text,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: colorText),)),
            Expanded(child: Icon(iconData)),

          ],
        ),
      )),
      height: 150,
      width: 50,
      color:backgroundColor,
    ),
  );

}

Widget listTileDrawer({required Color color,required IconData iconData, required String title, required void Function() onTapListTile })
{

  return  GestureDetector(
    onTap: onTapListTile,
    child: ListTile(
      leading: Icon(iconData,color: color,),
      title:  Text(title, style: TextStyle(color: color,),),
    ),
  );

}
Widget listTileDrawer2({required IconData iconData, required String title, required void Function() onTapListTile})
{
  return  InkWell(
    onTap: onTapListTile,
    child: Container(
      height: 50,
        width: 80,
     child : Row(

       children:
     [
       Icon(iconData),
       Text(title)
     ],)
    )
  );

}