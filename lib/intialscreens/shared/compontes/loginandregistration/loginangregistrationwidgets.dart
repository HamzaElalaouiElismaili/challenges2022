import 'package:flutter/material.dart';

Widget myFormFieldRegister({
  required TextEditingController controller,
  required Icon prefixIcon,
  required void Function() onTab,
  String? labelText,
  String? hintText,
  required Function validate,
  Function? onChange,
  Widget? suffixIcon,
  TextInputType? type,
  bool isPass = false,
  Function? suffixPressed,
  bool isClickable = true,
}) {
  return SizedBox(
    child: TextFormField(
      obscureText: isPass ? true : false,
      controller: controller,
      enabled: isClickable,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.1),
        filled: true,
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon!,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Colors.grey, width: .5),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
      ),
      validator: (value) => validate(value),
      onChanged: (value) => onChange!(value),
      onTap: onTab,
      keyboardType: type,
    ),
  );
}


Widget myFormFieldLogin({
  required TextEditingController controller,
  required Icon prefixIcon,
  required Function validate,
  Function? onChange,
  required Function() ontab,
  String? labelText,
  String? hintText,
  Widget? suffixIcon,
  TextInputType? type,
  bool isPass = false,
  Function? suffixPressed,
  bool isClickable = true,
}) {
  return SizedBox(
    child: TextFormField(
      obscureText: isPass ? true : false,
      controller: controller,
      enabled: isClickable,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.1),
        filled: true,
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon!,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Colors.grey, width: .5),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
      ),
      validator: (value) => validate(value),
      onChanged: (value) => onChange!(value),
      onTap: ontab,
      keyboardType: type,
    ),
  );
}


Widget loginScreenButton(
    {required String textButton,
      required Function() functionPressing,
      required ButtonStyle styleButton,
      required Color textColor}) {
  return SizedBox(
    height: 60,
    child: ElevatedButton(
      child: Text(
        textButton,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
      style: styleButton,
      onPressed: functionPressing,
    ),
  );
}

final ButtonStyle loginButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(
        color: Color(0xff9676ff),
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Color(0xff9676ff)),
);