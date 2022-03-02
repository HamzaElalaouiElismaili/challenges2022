
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/first%20month/shared/SearchWidgets/searchwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'followers/followers.dart';

class FriendsLayout extends StatelessWidget {
  final Map<String, dynamic> friend;

  const FriendsLayout({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
       listener : (context,state){},
        builder: (context,state)
        {
          var cubit = Appcubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: SafeArea(
                child: Column(
                  children: [
                    appBarFriend(context , id: friend["uId"]),
                    Column(
                      children: [
                        Container(
                          height: 210,
                          width: double.maxFinite,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    height: 90,
                                    width: 90,
                                    child: Image.network(friend["profileImage"]),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          friend["fullname"].toUpperCase(),
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 2.0, right: 2),
                                          child: Text(
                                            friend["address"],
                                            style: const TextStyle(),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 2.0, right: 2),
                                          child: Text(
                                            friend["phone"],
                                            style: const TextStyle(height: 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //bottomFriendButton(),
                                ],
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(friend["bio"]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 116,
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
                      ],
                    ),
                  ],
                )),
          );
        });
  }
}

Widget bottomFriendButton() {
  return SizedBox(
    height: 70,
    width: 210,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            bottomAlertButton(
                iconData: Icons.person_add, onTabb: () => print("dodo")),
            Text(
              "Add Friend",
              style: TextStyle(height: 1, color: Colors.indigoAccent[100]),
            ),
          ],
        ),
        Column(
          children: [
            bottomAlertButton(
                iconData: Icons.call_outlined, onTabb: ()
            {
              joinMeeting(serverUrl:"", roomId: "uidchallenge" ,isCallVoice:true,isVideoCall: true);
            }),
            Text(
              "Call",
              style: TextStyle(height: 1, color: Colors.indigoAccent[100]),
            ),
          ],
        ),
        Column(
          children: [
            bottomAlertButton(
                iconData: Icons.videocam_outlined, onTabb: ()
            async{
              joinMeeting(serverUrl:"", roomId: "uidchallenge" ,isCallVoice:true,isVideoCall: true);
            } ),
            Text(
              "Cam Video",
              style: TextStyle(height: 1, color: Colors.indigoAccent[100]),
            ),
          ],
        ),
        Column(
          children: [
            bottomAlertButton(
                iconData: Icons.message_outlined, onTabb: ()
            {

              print("friendlayout");

            } ),
            Text(
              "Message",
              style: TextStyle(height: 1, color: Colors.indigoAccent[100]),
            ),
          ],
        ),
      ],
    ),
  );
}
