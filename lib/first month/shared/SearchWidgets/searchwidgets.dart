import 'dart:io';

import 'package:challenges2022/first%20month/Layouts/Chats/Chats.dart';
import 'package:challenges2022/first%20month/Layouts/friendLayout.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

Widget suggestionsFriends({required BuildContext context,required String imageProfile, required String fullName ,required Map<String, dynamic> data}) {
  return GestureDetector(
    onTap: ()=> goTo(context, FriendsLayout(friend: data,)),
    child: Container(
      decoration:BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(3),border: Border.all(color: Colors.indigoAccent.withAlpha(100),width: 1)),
      height: 70,
      child: Center(
        child: ListTile(
          leading: GestureDetector(
              onTap: ()
              {
                alertInfo(context,imageProfile: imageProfile,fullName: fullName,data: data);
              },
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(imageProfile),
              )),
          title: Text(fullName),
        ),
      ),
    ),
  );
}

Future alertInfo(context,
    {required String imageProfile,
      required String fullName,
      required Map<String, dynamic> data,

    }) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: ClipRRect(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    child: Image.network(imageProfile, fit: BoxFit.cover,
                      height: 250,
                      width: 250,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Stack(
                      alignment:Alignment.topLeft,
                      children: [
                        Container(
                          height: 30,
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(fullName,style:const  TextStyle(color: Colors.white ,fontSize: 16),),
                          ),
                          color: Colors.black87.withOpacity(0.3),
                        ),
                      ],
                    ),
                  )
                ],

              ),
              Container(
                color: Colors.white,
                height: 50,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bottomAlertButton(iconData: Icons.videocam, onTabb: ()
                      {

                      joinMeeting(serverUrl:"", roomId: "uidchallenge" ,isCallVoice:true,isVideoCall: true);

                      }),

                      bottomAlertButton(iconData: Icons.message, onTabb: ()
                      {
                       goTo(context,  ChatDetailsScreen(friend: data, ));
                      }),

                      bottomAlertButton(iconData: Icons.info, onTabb: ()
                      {
                        infoFunction(context,data: data);
                      }),

                      bottomAlertButton(iconData: Icons.person_add, onTabb: ()=>print("dodo")),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


Widget bottomAlertButton({required IconData iconData , required void Function() onTabb})
{
  return IconButton(icon: Icon(iconData) ,color: Colors.indigoAccent[100],onPressed: onTabb,);

}



Widget searchBar({required void Function() onTab})
{
  return  Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child:ElevatedButton(onPressed: onTab,child:Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.start ,
      children:const [
        Icon(Icons.search),
        SizedBox(width: 10,),
        Text("Search"),

      ],
    ) ,style: ElevatedButton.styleFrom(
        primary:  Colors.grey[200],
      elevation: 0,
      onPrimary: Colors.black,
      shadowColor: Colors.black
    ),)
    ,width: double.maxFinite,height: 50,decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(30)),);

}

Widget backSearchButton({required void Function() goBack})
{
  return  InkWell(onTap:goBack ,child: const Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
    child:  Icon(Icons.arrow_back_ios),
  ));
}

Widget clearSearchBar({required void Function() clear}){
  return InkWell(onTap: clear,child: const Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
    child:  Icon(Icons.close),
  ));
}


void infoFunction(context,{required Map<String, dynamic> data})
{
  goBack(context);
  goTo(context, FriendsLayout(friend: data,));
}



joinMeeting({required String serverUrl, required String roomId,required bool isCallVoice,required bool isVideoCall}) async {

  Map<FeatureFlagEnum, bool> featureFlags = {
    FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,};
  if (!kIsWeb) {
    if (Platform.isAndroid) {
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = true;
      featureFlags[FeatureFlagEnum.ADD_PEOPLE_ENABLED] = false;
      featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      featureFlags[FeatureFlagEnum.INVITE_ENABLED] = false;
      featureFlags[FeatureFlagEnum.LIVE_STREAMING_ENABLED] = false;
      featureFlags[FeatureFlagEnum.RAISE_HAND_ENABLED] = false;
      featureFlags[FeatureFlagEnum.CHAT_ENABLED] = false;
      featureFlags[FeatureFlagEnum.CALENDAR_ENABLED] =true ;

    } else if (Platform.isIOS) {
      featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
    }
  }
  var options = JitsiMeetingOptions(room: roomId)
    ..userAvatarURL = "student.studentId"
    ..serverURL = null
    ..subject = "subjectText"
    ..userDisplayName = "nameText"
    ..userEmail = "emailText"
    ..audioOnly = isCallVoice
    ..audioMuted = isCallVoice
    ..videoMuted = isCallVoice
    ..featureFlags.addAll(featureFlags)
    ..webOptions = {
      "roomName": roomId,
      "width": "100%",
      "height": "100%",
      "enableWelcomePage": false,
      "chromeExtensionBanner": null,
      "userInfo": {"displayName": "text"}
    };

  debugPrint("JitsiMeetingOptions: $options");
  await JitsiMeet.joinMeeting(
    options,
    listener: JitsiMeetingListener(
        onConferenceWillJoin: (message) {
          print("Haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
          //  debugPrint("${options.room} will join with message: $message");
        },
        onConferenceJoined: (message) {
          print("Hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

          // debugPrint("${options.room} joined with message: $message");
        },
        onConferenceTerminated: (message) {
          print("Hkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");

          //  debugPrint("${options.room} terminated with message: $message");
        },
        genericListeners: [
          JitsiGenericListener(
              eventName: 'readyToClose',
              callback: (dynamic message) {
                debugPrint("readyToClose callback");
              }),
        ]),
  );
}
