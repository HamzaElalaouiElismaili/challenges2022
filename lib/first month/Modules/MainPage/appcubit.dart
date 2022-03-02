
import 'dart:convert';
import 'dart:io';

import 'package:challenges2022/first%20month/Modeles/msgmodel.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Network/local.dart';
import 'package:challenges2022/first%20month/main_chat_app/main_chat_app.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/Component/appwidgets.dart';
import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';
import 'package:challenges2022/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:http/http.dart' as http;


import 'HomePage/homepage.dart';
import 'main_cubit_controller.dart';

class Appcubit extends Cubit<Appstates> {


  Appcubit() : super(Appinitialstate());

  static Appcubit get(context) => BlocProvider.of(context);

  double? height;
  double? width ;
  double myRadius = 0;
  bool isDrawer = true;
  bool animatedDrawer = false ;
  bool isVisibleHomePage = true ;
  int drawerColor = 0;
  Widget widget =  HomePage();
  var image  = userModel.file;
  var picker = ImagePicker();
  File? profileImage;
  double drawer2Padding = 20.0;
  Locale? localeApp = const Locale("fr" ,"");
  List<MessageModel> messages = [];
  File? messageimage;
   //chooselangg
  String langValue = "Français";//"${getLang(context , "profilesetting")}"
  List<String> langList = ["العربية","Français","English"];


  void settingLang(context)
  {
    emit(LanguageChangedArabic());

    if(langValue =="العربية")
    {
      languageChange( locale:Locale("ar",""));
      CashLocal.saveData(key: 'locale', value: "ar");
      CashLocal.saveData(key: 'languageSelected', value: true);
    }

    else if(langValue =="Français")
    {
      languageChange(locale:const Locale("fr",""));
      CashLocal.saveData(key: 'locale', value: "fr");
      CashLocal.saveData(key: 'languageSelected', value: true);
    }

    else if(langValue =="English")
    {
      languageChange(locale:const Locale("fr",""));
      CashLocal.saveData(key: 'locale', value: "fr");
      CashLocal.saveData(key: 'languageSelected', value: true);
    }
    else
    {
      customAlertDialog(context, textButton: 'Close', alertDialogFunction: ()
      {
        goBackMaybe(context);
      }, title: ' Wrong  ', errorType: 'Please Choose Language');

    }

    emit(LanguageChangedArabic());

  }



  void languageChange({Locale? locale}) {
    if(locale == const Locale("ar",""))
    {
      localeApp = const Locale("ar","");
      emit(LanguageChangedArabic());
    }
    if(locale == const Locale("fr",""))
    {
      localeApp = const Locale("fr","");
      emit(LanguageChangedFrance());

    }



  }

  void getMyInfo() {
    emit(GetMyInfoLoading());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(
        {
          "token": tokenme
        }).then((value)
    {
      emit(UpdateTokenSuccessflly());

    }).catchError((error)
    {
      emit(UpdateError(error.toString()));
    });

    FirebaseFirestore
        .instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value)
    {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetMyInfoSuccessfully());
    }).catchError((error)
    {

      print(error.toString());
      emit(GetMyInfoError(error.toString()));

    });

  }


  void emitAndGetInfo() {
    getMyInfo();
    emit(EmitAndGetMyInfo());
  }

  void openDrawer() {
    isDrawer = !isDrawer;
    if (isDrawer==false) {myRadius = 20;}
    else {myRadius = 0;}

    emit(OpenDrawerState());
  }

  drawerController() {
    emit(ChangeDrawer());
  }

  void  animationDrawer() {

    if(animatedDrawer == false )
    {
      drawer2Padding = 0;
      isVisibleHomePage = false;
    } else
    {
      drawer2Padding = 20;
      isVisibleHomePage = true;
    }

    animatedDrawer = !animatedDrawer;

    emit(AnimationDrawer());
  }

  update({
    required String upemail,
    required String upphone,
    required String upbirthDay,
    required String upfullname,
    required String upaddr,
    required String profileImage,
    required List listFriends,
    required List followers,
    required String bio,
    required String token,

  }) {
    UserModel model = UserModel(
        bio: bio,
        fullname: upfullname,
        birthday: upbirthDay,
        email: upemail,
        phone: upphone,
        uId: userModel.uId,
        address: upaddr,
        token: token,
        listFriends: listFriends ,
        followers :followers,
        profileImage: profileImage,
        isEmailVerified: userModel.isEmailVerified);

    emit(UpdateLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value)
    {
      userModel.file = File(CashLocal.getData(key: "myimage"));
      emit(UpdateSuccessflly());

    }).catchError((error)
    {
      emit(UpdateError(error.toString()));
    });
  }


  Future<void> getCoverImage() async {
    emit(CoverImagePicckedLoadingState());

    picker.pickImage(source: ImageSource.gallery).then((value)
    {

      if (value != null)
      {
        profileImage = File(value.path);
        CashLocal.saveData(key: 'myimage', value: profileImage!.path);
        userModel.file = profileImage;
        test2 = profileImage;
        print(value.path);
        emit(CoverImagePicckedSuccessState(profileImage!));
      } else {
        print('No image selected.');
        emit(CoverImagePicckedErrorState());
      }

    });

  }


  void uploadProfileImage({
    required String? name,
    required String? email,
    required String? phone,
    required String? upbirthDay,
    required String? upaddr,
  }) {
    emit(UploadingLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${userModel.uId}/${Uri.file(test2!.path).pathSegments.last}')
        .putFile(test2!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        debugPrint(value);
        update(token: userModel.token!,bio: userModel.bio!,followers:userModel.followers!,listFriends: userModel.listFriends!,upemail: email!, upfullname: name!, upbirthDay: upbirthDay!, upphone: phone!, upaddr: upaddr! ,profileImage : value);
        emit(ProfileImageUploadSuccessState());
      }).catchError((error) {
        emit(ProfileImageUploadErrorState());
      });
    }).catchError((error) {
      emit(ProfileImageUploadErrorState());
    });
  }


  addNewFriend({friendId}) {
    userModel.followers!.add(friendId);
    emit(AddNewFriend());
  }

  removeFriend({friendId}) {
    userModel.followers!.remove(friendId);
    userModel.followers!.join(',');
    emit(AddNewFriend());
  }


  addNewFollowers({ required friendId,required list}) {
    list.add(friendId);
    emit(AddNewFriend());
  }


  removeFollowers({ required friendId,required list}) {
    list.remove(friendId);
    list.join(',');
    emit(AddNewFriend());
  }


  addUpdate({required  String friendUid , required list}) {
    emit(UpdateLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(friendUid)
        .update({"listFriends": list})
        .then((value)
    {
      emit(UpdateSuccessflly());

    }).catchError((error)
    {
      emit(UpdateError(error.toString()));
    });
  }


  Future logout()  async {
    CashLocal.removeData(key: "uid");
    CashLocal.removeData(key: "token");
    await FirebaseAuth.instance.signOut();

  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    String? text,
    String? messgeimage,
  }) {
    MessageModel model = MessageModel(
      text: text ?? '',
      dateTime: dateTime,
      receiverId: receiverId,
      senderId: userModel.uId,
      messageimage: messgeimage ?? '',
    );

    if (model.text == '' && model.messageimage == '') {
    } else {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(receiverId)
          .collection('messages')
          .add(model.toMap())
          .then((value) {
        emit(SocialSendMessageSuccessState());
      }).catchError((error) {
        emit(SocialSendMessageErrorState());
      });
      FirebaseFirestore.instance
          .collection('chats')
          .doc(userModel.uId)
          .collection('messages')
          .add(model.toMap())
          .then((value) {
        emit(SocialSendMessageSuccessState());
      }).catchError((error) {
        emit(SocialSendMessageErrorState());
      });
    }
  }


  void uploadMessageImage({
    required String receiverId,
    required String datetime,
    required String text,
  }) {
    emit(SocialCreateMessageImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('messages/${Uri.file(messageimage!.path).pathSegments.last}')
        .putFile(messageimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        sendMessage(
            dateTime: datetime,
            text: text,
            messgeimage: value,
            receiverId: receiverId);
      }).catchError((error) {
        emit(SocialCreateMessageImageErrorState());
      });
    }).catchError((error) {
      emit(SocialCreateMessageImageErrorState());
    });
  }


  Future<void> getMessageImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      messageimage = File(pickedFile.path);
      emit(SocialMessageImagePicckedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialMessageImagePicckedErrorState());
    }
  }

  void getMessages({
    required String receiverId,
  }) {
    emit(SocialgetMessageLoadingState());
    FirebaseFirestore.instance
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialgetMessageSuccessState());
    });
  }

  void removeMessageImage() {
    messageimage = null;
    emit(Socialremovemessageimagesuccessstate());
  }


  void listingToNotification()
  {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null)
      {
        print(" go to Profile ");
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: "test",
              icon: 'maroc',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(' otification clicked ');
    });

    FirebaseMessaging.onMessage.listen((event) {
      print("this the title =>  ${event.notification!.title}"  );
      print("this the body => ${event.notification!.body}"  );

    });

  }

  getToken() async
  {
    String? token = await FirebaseMessaging.instance.getToken();
    userModel.token = token;
    token = token;
    print(token);
    CashLocal.saveData(key: "token", value: token);
    emit(UpdateTokenSuccessflly());

  }


  Future  sendNotify({required String title,required String body,required String id ,required String fcmToken,required String name}) async
  {
     print("send notification");
    String token = "AAAA8JBYmc4:APA91bFRQNacc5xCExBjSmGfC4Z6C47-l-sEB09p1uwMP1oEHvp13_btuqXqm51lyQ5CE_hajYpw6zIm6OrQwwPL6HhzcRzmqjzeDDju43gCCMgVDS9dva5p5Zx7aXZQSHNxWPTWQZ1G";
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$token',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>
          {
            'title': title,
            'body': body,
          },
          'priority': 'high',
          'data': <String,dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            "id" : id.toString(),
            "name" : name.toString()
          },
          'to': fcmToken,
        },
      ),
    );
  }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
          );
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
          );
        }
        break;
      case 'unsubscribe':
        {
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
          );
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
          );
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
              'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
            );
          }
        }
        break;
      default:
        break;
    }
  }






}


bool? continer;