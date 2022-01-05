import 'package:challenges2022/Modules/OnBoarding/onboarding_model.dart';
import 'package:flutter/material.dart';

Widget buildBoardingItem({required BoardingModel model}) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      const SizedBox(height: 30),
      Text(model.title, style: const TextStyle(fontSize: 16,height: 1),),
      const SizedBox(height: 20),
      Text(model.body, style: const TextStyle(fontSize: 16,height: 1)),
    ]);


AnimatedContainer animatedPage({required int index}) => AnimatedContainer(
  duration: const Duration(milliseconds: 150),
  margin: const EdgeInsets.only(right: 5),
  height: 10,
  width:  currentPage == index ? 20 : 10,
  decoration: BoxDecoration(
    color:  currentPage == index ? Colors.indigoAccent : Colors.indigo,
    borderRadius: BorderRadius.circular(10),
  ),
);
