import 'package:challenges2022/interviewapp/controllerapp.dart';
import 'package:challenges2022/interviewapp/locationhelper.dart';
import 'package:challenges2022/interviewapp/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  await Firebase.initializeApp();
  currentPosition = await LocationHelper.getCurrentLocation();
  print("longitude is  ${currentPosition.longitude}  latitude is ${currentPosition.latitude}");

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAU1tQEgIWLjLBgnnlb4XKbzeGPQhv5LGE',
      appId: '1:1033213876686:android:f9bbd61c470a846958f39f',
      messagingSenderId: '1033213876686',
      projectId: 'challanges2022',
    ),
  );
  runApp(MyApp(camera: firstCamera,));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  MyApp ({Key? key, required this.camera, }) : super(key: key);
  final appInterviewController = Get.put(AppInterviewController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapView(camera: camera,),
    );
  }
}
