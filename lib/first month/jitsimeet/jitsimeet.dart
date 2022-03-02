import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';


class Meeting extends StatefulWidget {
  final String userUid;
  final String myuid;

   Meeting({Key? key, required this.myuid, required this.userUid});
  @override
  _MeetingState createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {

  final serverText = TextEditingController();
//  final roomText = "${widget.userUid}";
  final subjectText = TextEditingController(text: " Subject");
  final nameText = "student.username";
  // final emailText = TextEditingController(text: "fake@email.com");
  final emailText = "student.email";
  //final iosAppBarRGBAColor = TextEditingController(text: "#0080FF80"); //transparent blue
  bool? isAudioOnly = true;
  bool? isAudioMuted = true;
  bool? isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: kIsWeb ? meetConfiForWeb(context) : meetForPhone(),
      ),);
  }



  Widget meetForPhone() {
    return
      Center(
          child: ElevatedButton(
              child :const Text("go to meet"),
              onPressed:  _joinMeeting));
  }

  Widget meetConfiForWeb(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.30,
          child: meetConfig(),
        ),
        Container(
            width: width * 0.60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.white54,
                  child: SizedBox(
                    width: width * 0.60 * 0.70,
                    height: width * 0.60 * 0.70,
                    child: JitsiMeetConferencing(
                      extraJS: [
                        // extraJs setup example
                        '<script>function echo(){console.log("echo!!!")};</script>',
                        '<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>'
                      ],
                    ),
                  )),
            ))
      ],
    );
  }

  Widget meetConfig() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: serverText,
            decoration: const InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Server URL",
                hintText: "Hint: Leave empty for meet.jitsi.si"),
          ),
          const SizedBox(
            height: 14.0,
          ),
          const TextField(
            // controller: roomText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Room",
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: subjectText,
            decoration: const InputDecoration(
              border:  OutlineInputBorder(),
              labelText: "Subject",
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          const TextField(
            decoration: InputDecoration(
              border:  OutlineInputBorder(),
              labelText: "Display Name",
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          const TextField(
            //  controller: emailText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
          ),
          const SizedBox(height: 14.0,),

          const SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: const Text("Audio Only"),
            value: isAudioOnly,
            onChanged: _onAudioOnlyChanged,
          ),
          const SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: const Text("Audio Muted"),
            value: isAudioMuted,
            onChanged: _onAudioMutedChanged,
          ),
          const SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: const Text("Video Muted"),
            value: isVideoMuted,
            onChanged: _onVideoMutedChanged,
          ),
          const Divider(
            height: 48.0,
            thickness: 2.0,
          ),
          SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                _joinMeeting();
              },
              child: const Text(
                "Join Meeting",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue)),
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
        ],
      ),
    );
  }

  _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting() async {

    String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

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
    var options = JitsiMeetingOptions(room: widget.userUid+widget.myuid)
      ..userAvatarURL = "student.studentId"
      ..serverURL = serverUrl
      ..subject = subjectText.text
      ..userDisplayName = nameText
      ..userEmail = emailText
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": widget.userUid+widget.myuid,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": nameText}
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

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}





