import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../View/onboarding/onboardingmodel.dart';

Widget buildBoardingItem({required BuildContext context,required BoardingModel model}) =>
    Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
         SvgPicture.asset(model.image,height: MediaQuery.of(context).size.height/2+25,width: 150,),
          const SizedBox(height: 30),
          Text(model.title, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          const SizedBox(height: 20),
          Text(model.body, style: const TextStyle(fontSize: 17,height: 1.3),textAlign: TextAlign.center,),
        ]);


AnimatedContainer animatedPage({required int index}) => AnimatedContainer(
  duration: const Duration(milliseconds: 150),
  margin: const EdgeInsets.only(right: 5),
  height: 8,
  width:  currentPage == index ? 16 : 8,
  decoration: BoxDecoration(
    color:  currentPage == index ? Colors.indigoAccent : Colors.indigo,
    borderRadius: BorderRadius.circular(10),
  ),
);


Widget bottomDotedBar({required BuildContext context}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if (isLastOnBoarding == false)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextButton(
              onPressed: () => submit(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "skip",
                  style: const TextStyle(
                      color: Colors.black, height: 1),
                ),
              )),
        ),
      if (isLastOnBoarding == true)
        SizedBox(width: MediaQuery.of(context).size.width/3-30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          boarding.length,
              (index) => animatedPage(index: index),
        ),
      ),
      if (isLastOnBoarding == false)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Container(
            height: 35,
            width: 50,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextButton(
              child:Icon(Icons.arrow_forward,color: Colors.black,),
              onPressed: () {
                if (isLastOnBoarding == true) {
                  submit(context);
                } else {
                  boarderController.nextPage(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.fastLinearToSlowEaseIn);
                }
              },

            ),
          ),
        ),
      if (isLastOnBoarding == true)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: TextButton(
            child:Text("Done",style: TextStyle(color: Colors.black),),
            onPressed: () {
              if (isLastOnBoarding == true) {
                submit(context);
              } else {
                boarderController.nextPage(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.fastLinearToSlowEaseIn);
              }
            },

          ),
        ),
    ],
  );

}


// this  styles for the 2 page => onBoarding
final ButtonStyle onBoardingButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.indigoAccent,
  onPrimary: Colors.white,
);
