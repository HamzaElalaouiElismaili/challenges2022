import 'package:challenges2022/intialscreens/View/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/LocalizationController/localizationcontroller.dart';
import '../../shared/contsents.dart';

LocalizationController localizationController = Get.find();

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}


bool isLastOnBoarding = false;
PageController boarderController = PageController();

int currentPage  = 0;


void submit(context)
{
  storage.write("OnboardingValue", true).then((value)
  {
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> WelcomeScreen()));
  });
}


List<BoardingModel> boarding = [
//first
  BoardingModel(
      image: "assets/omr/omrassets/onboarding/svg1.svg",
      title: "Media messages",
      body: "Send and receiver photos and Videos with same quality"),

//second
  BoardingModel(
      image: "assets/omr/omrassets/onboarding/svg2.svg",
      title: "Explore Places",
      body: "Discover & Select amazing places and arrive safely to your destination is our first priority"),

//third
  BoardingModel(
      image: "assets/omr/omrassets/onboarding/svg3.svg",
      title: "Privacy Protection",
      body: "All your data and messages are encrypted and safe"),

];
