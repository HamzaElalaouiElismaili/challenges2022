import 'package:challenges2022/Modules/MainPage/mainpage.dart';
import 'package:challenges2022/Modules/login_screen/login_screen_ui.dart';
import 'package:challenges2022/Network/local.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:flutter/material.dart';

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

int currentPage  = 0 ;


void submit(context)
{

  CashLocal.saveData(key: 'onboarding', value: true).then((value)
  {
    if (value)  goToReplace(context,  LoginPage());
  });


}


List<BoardingModel> boarding = [
//first
  BoardingModel(
      image: "assets/images/board1.png",
      title: "Lorem Ipsum is simply dummy text of the printing and typesetting ",
      body: "Lorem Ipsum 1"),

//second
  BoardingModel(
      image: "assets/images/board2.png",
      title: "Lorem Ipsum is simply dummy text of the printing and typesetting ",
      body: "Lorem Ipsum 2"),

//third
  BoardingModel(
      image: "assets/images/board1.png",
      title: "Lorem Ipsum is simply dummy text of the printing and typesetting ",
      body: "Lorem Ipsum 3 "),

];

