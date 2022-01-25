import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/shared/SearchWidgets/searchwidgets.dart';
import 'package:flutter/material.dart';

class FriendsLayout extends StatelessWidget {
  final Map<String, dynamic> friend ;
  const FriendsLayout({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:SafeArea(child: Column(
        children: [
          appBarFriend(context),
          Column(
            children: [
              Container(
                height: 250,
                width: double.maxFinite,
                color:  Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   const SizedBox(height: 15,),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(friend["profileImage"]),
                    ),
                    const SizedBox(height: 5,),
                    Text(friend["fullname"]),
                    Text(friend["address"]),
                    bottomFriendButton(),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 80,
                width: double.maxFinite,
                color:  Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status",style: TextStyle(fontWeight: FontWeight.bold,height: 1, color: Colors.indigoAccent[100]),),
                     const  Text("Hi , I'm New Here",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),

              )
            ],
          ),
        ],
      )),
    );
  }
}



Widget bottomFriendButton()
{

  return  SizedBox(
    height: 70,
    width: 210,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            bottomAlertButton(iconData: Icons.person_add, onTabb: ()=>print("dodo")),
            Text("Add Friend" ,style: TextStyle(height: 1, color: Colors.indigoAccent[100]),),
          ],
        ),
        Column(
          children: [
            bottomAlertButton(iconData: Icons.call, onTabb: ()=>print("dodo")),
            Text("Call" ,style: TextStyle(height: 1, color: Colors.indigoAccent[100]),),
          ],
        ),
        Column(
          children:
          [
            bottomAlertButton(iconData: Icons.videocam, onTabb: ()=>print("dodo")),
            Text("Cam Video" ,style: TextStyle(height: 1, color: Colors.indigoAccent[100]),),
          ],
        ),
      ],
    ),
  );
}


Widget appBarFriend(context)
{
 return   Container(
   color:Colors.white ,
   child: Row(
     crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       InkWell(onTap: ()=>goBackMaybe(context),
         child: Container( height: 50,
           child: const Padding(
             padding: EdgeInsets.all(10.0),
             child: Icon(Icons.arrow_back ,),
           ),
           color:  Colors.white,),
       ),
       Container( height: 50,
         child: Padding(
             padding: const EdgeInsets.all(10),
             child:  PopupMenuButton(itemBuilder: (context)=>
             [
               PopupMenuItem(onTap:()=>print("close"),child:const  Text("Close     button")),
               PopupMenuItem(onTap:()=>print("this"),child:const Text("Close     button")),
               PopupMenuItem(onTap:()=>print("test"),child: const Text("Close     button")),

             ],icon: const Icon(Icons.more_vert),)
         ),
         color:  Colors.white,),
     ],
   ),
 );
}