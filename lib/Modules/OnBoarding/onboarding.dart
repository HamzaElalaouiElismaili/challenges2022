import 'package:challenges2022/Localization/localization.dart';
import 'package:challenges2022/shared/Component/onboardingWidgets/onboardingWidgets.dart';
import 'package:challenges2022/shared/Styles/styles.dart';
import 'package:flutter/material.dart';
import 'onboarding_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10),
                child: Container(
                    height: 45,
                    width: 80,
                    decoration: const BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: TextButton(
                        onPressed: () => submit(context),
                        child:  Padding(
                          padding:const EdgeInsets.all(5.0),
                          child: Text(
                            "${getLang(context , "skip")}",
                            style:const TextStyle(color: Colors.white, height: 1),
                          ),
                        ))),
              ),
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
                              buildBoardingItem(model: boarding[index]),
                          itemCount: boarding.length,
                          physics: const BouncingScrollPhysics(),
                          controller: boarderController),
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 15),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      boarding.length,
                      (index) => animatedPage(index: index),
                    ),
                  ),
                  if (isLastOnBoarding == false) const SizedBox(height: 45),
                  if (isLastOnBoarding == true) const SizedBox(height: 10),
                  if (isLastOnBoarding == true)
                    Container(
                      height: 35,
                      width: 100,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: ElevatedButton(
                          style: onBoardingButtonStyle,
                          onPressed: () {
                            if (isLastOnBoarding == true) {
                              submit(context);
                            } else {
                              boarderController.nextPage(
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text(
                                "${getLang(context , "next")}",
                                style:  const TextStyle(height: 1, color: Colors.white),
                              ),
                             const  Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
