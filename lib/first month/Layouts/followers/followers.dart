
import 'package:challenges2022/first%20month/Layouts/QR/mypageqr.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/SearchWidgets/searchwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFollowers extends StatelessWidget {
  final Map<String, dynamic> friend ;
  const MyFollowers({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,staate){},
        builder:(context,state)
        {
          var cubit = Appcubit.get(context);
          return  Scaffold(
            backgroundColor: Colors.grey[200],
            body:SafeArea(child: Column(
              children: [
                appBarFriend(context, id: friend["uId"] ),
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
                          bottomFriendButton()

                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if(userModel.followers!.contains(friend["uId"]) && userModel.uId != friend["uId"])
                              InkWell(
                                onTap: ()
                                {
                                  var id = userModel.uId!;
                                  cubit.removeFriend(friendId: friend["uId"]);
                                  cubit.removeFollowers(friendId: id,list: friend["listFriends"]);
                                  cubit.update(
                                    token: userModel.token!,
                                      upemail: userModel.email!,
                                      upphone: userModel.phone!,
                                      upbirthDay: userModel.birthday!,
                                      upfullname: userModel.fullname!,
                                      upaddr: userModel.address!,
                                      profileImage: userModel.profileImage!,
                                      listFriends: userModel.listFriends!,
                                      followers: userModel.followers!,
                                      bio: userModel.bio!);
                                  cubit.addUpdate(friendUid: friend["uId"] ,list: friend["listFriends"]);
                                },
                                child: Card(
                                  color: Colors.indigoAccent[100],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.person_remove),
                                        Text("Add"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            Card(
                              color: Colors.indigoAccent[100],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("${friend["listFriends"]!.length}"),
                                    const Text("Followers"),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.indigoAccent[100],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("${friend["followers"]!.length}"),
                                    const Text("Following"),
                                  ],
                                ),
                              ),
                            ),
                            if(!userModel.followers!.contains(friend["uId"]) && userModel.uId != friend["uId"])
                              InkWell(
                                onTap: ()
                                {
                                  var id = userModel.uId!;
                                  cubit.addNewFriend(friendId: friend["uId"]);
                                  cubit.addNewFollowers(friendId: id,list: friend["listFriends"]);
                                  cubit.update(
                                      token: userModel.token!,
                                      upemail: userModel.email!,
                                      upphone: userModel.phone!,
                                      upbirthDay: userModel.birthday!,
                                      upfullname: userModel.fullname!,
                                      upaddr: userModel.address!,
                                      profileImage: userModel.profileImage!,
                                      listFriends: userModel.listFriends!,
                                      followers: userModel.followers!,
                                      bio: userModel.bio!);
                                  cubit.addUpdate(friendUid: friend["uId"] ,list: friend["listFriends"]);
                                  cubit.getMyInfo();
                                },
                                child: Card(
                                  color: Colors.indigoAccent[100],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.person_add),
                                        Text("Add"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
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
                              Text(friend["bio"],style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),

                    ),


                  ],
                ),
                const Spacer(),
              ],

            )
            )
            ,
          );
        } );
  }
}



Widget bottomFriendButton()
{

  return  SizedBox(
    height: 70,
    width: 150,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Column(
          children: [
            bottomAlertButton(iconData: Icons.call, onTabb: () async {
              joinMeeting(serverUrl:"", roomId: "uidchallenge" ,isCallVoice:true,isVideoCall: true);
            }),
            Text("Call" ,style: TextStyle(height: 1, color: Colors.indigoAccent[100]),),
          ],
        ),
        const Spacer(),
        Column(
          children:
          [
            bottomAlertButton(iconData: Icons.videocam, onTabb: () async{
              joinMeeting(serverUrl:"", roomId: "uidchallenge" ,isCallVoice:true,isVideoCall: true);
            }),
            Text("Cam Video" ,style: TextStyle(height: 1, color: Colors.indigoAccent[100]),),
          ],
        ),
      ],
    ),
  );
}


Widget appBarFriend(context ,{required String id})
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

        InkWell(onTap: ()
        {
          goTo(context,   MyQrCreator(id:id,));
        }
          ,child: Container( height: 50,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.qr_code ,),
            ),
            color:  Colors.white,),
        ),



      ],
    ),
  );
}


/*
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
color:  Colors.white,)*/
