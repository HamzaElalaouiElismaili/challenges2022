


import 'dart:ui';

import 'package:flutter/material.dart';

Widget numberTextField({required BuildContext context,required TextEditingController controller, onChange,required bool first,required bool last})
{
  return Expanded(
    child: TextField(
      autofocus: true,
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      showCursor: false,
      readOnly: false,
      maxLength: 1,
      textInputAction: TextInputAction.next,
      onChanged:(value)
      {
        if(value.length == 1 && last == false)
        {
          FocusScope.of(context).nextFocus();
        }
        if(value.length ==0 &&  first == false)
        {
          FocusScope.of(context).previousFocus();
        }

      } ,
      decoration: InputDecoration(counterText: "",hintText: "#"),
    ),
  );
}



Widget loginButton(
    {required String textButton,
      required Function() functionPressing,
      required ButtonStyle styleButton,required Color textColor}) {
  return SizedBox(
    height: 60,
    width: double.maxFinite,
    child: ElevatedButton(
      child: Text(
        textButton,
        style:  TextStyle(color: textColor ,fontSize: 14,fontWeight: FontWeight.bold),
      ),
      style: styleButton,
      onPressed: functionPressing,
    ),
  );
}

final ButtonStyle registerButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side:  BorderSide(
        color: Color(0xff9676ff),
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Color(0xff9676ff)),
);

final ButtonStyle loginButtonStyleWelcome = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: const BorderSide(
        color: Color(0xff9676ff),
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.white),
);