import 'package:challenges2022/first%20month/shared/Styles/styles.dart';
import 'package:flutter/material.dart';

void customAlertDialog(BuildContext context,
    { required String title,
      required String errorType,
      required Function() alertDialogFunction,
      required String textButton,}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
        content: SizedBox(
          height: 30,
          width: double.maxFinite,
          child: Text(
            errorType,textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          const SizedBox(height: 20),
          Center(
            child: alertDialogButton(textButton: textButton, functionPressing: alertDialogFunction)

          ),
          const SizedBox(height: 5)
        ],
      );
    },
  );
}


Widget alertDialogButton(
    {required String textButton,
      required Function() functionPressing,
      }) {
  return SizedBox(
    height: 40,
    width: 100,
    child: ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Text(
          textButton,
          style: const TextStyle(color: Colors.black,height: 1),
        ),
      ),
      style: alertDialogButtonStyle,
      onPressed: functionPressing,
    ),
  );
}




void customAlertDialog2(BuildContext context,
    { required String title,
      required String errorType,
      required Function() alertDialogFunction,
      required String textButton,
      required Function() alertDialogFunction2,
      required String textButton2,
    }) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
        content: SizedBox(
          height: 50,
          width: double.maxFinite,
          child: Text(
            errorType,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          const SizedBox(height: 20),
          Center(
              child: Row(
                children: [
                  Expanded(child: alertDialogButton(textButton: textButton, functionPressing: alertDialogFunction)),
                  const Spacer(),
                  Expanded(child: alertDialogButton(textButton: textButton2, functionPressing: alertDialogFunction2)),
                ],
              )

          ),
          const SizedBox(height: 5)
        ],
      );
    },
  );
}