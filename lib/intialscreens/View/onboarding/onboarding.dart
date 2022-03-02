import 'package:challenges2022/intialscreens/shared/compontes/onboardingwidgets/onboardingwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/LocalizationController/localizationcontroller.dart';
import 'onboardingmodel.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  LocalizationController localizationController = Get.find();

@override
  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 7),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    Expanded(
                      child: PageView.builder(
                          onPageChanged: (index) {
                            setState(() => currentPage = index);
                            if (index == boarding.length - 1) {
                              isLastOnBoarding = true;
                            } else {
                              isLastOnBoarding = false;
                            }
                          },
                          itemBuilder: (context, index) =>
                              buildBoardingItem(context: context,model: boarding[index]),
                          itemCount: boarding.length,
                          physics: const BouncingScrollPhysics(),
                          controller: boarderController),
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 15),
              bottomDotedBar(context: context),
              const SizedBox(height: 15),

            ],
          ),
        ));
  }
}


