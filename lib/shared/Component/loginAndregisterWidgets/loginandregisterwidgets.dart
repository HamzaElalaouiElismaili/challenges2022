import 'package:flutter/material.dart';

Widget myFormField({
  TextEditingController? controller,
  String? labelText,
  String? hintText,
  Function? validate,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Function? onChange,
  Function? onSubmit,
  Function? onTap,
  TextInputType? type,
  bool isPass = false,
  Function? suffixpressed,
  bool isclickable = true,
}) =>
    SizedBox(
      child: TextFormField(
        obscureText: isPass ? true : false,
        controller: controller,
        enabled: isclickable,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: Colors.indigo.withOpacity(0.1),
          filled: true,
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: () {
              if (suffixIcon != null) {
                suffixpressed!();
              } else {
                {}
              }
            },
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.white, width: .5),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        validator: (value) => validate!(value),
        // onChanged: (value) => onChange!(value),
        onFieldSubmitted: (value) => onSubmit!(value),
        onTap: () => onTap!(),
        keyboardType: type,
      ),
    );

Widget loginButton(
    {required String textButton,
    required Function() functionPressing,
    required ButtonStyle styleButton}) {
  return SizedBox(
    height: 60,
    width: double.maxFinite,
    child: ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          textButton,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "Cairo", fontSize: 25),
        ),
      ),
      style: styleButton,
      onPressed: functionPressing,
    ),
  );
}

Widget loginWithXButton(
    {required String pathAsses,
    required String textButton,
    required Function() functionPressing,
    required ButtonStyle styleButton}) {
  return SizedBox(
    height: 60,
    width: double.maxFinite,
    child: ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                pathAsses,
              ),
              backgroundColor: Colors.white,
              radius: 17,
            ),
            Expanded(
              child: Text(
                textButton,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20, height: 1, color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
      style: styleButton,
      onPressed: functionPressing,
    ),
  );
}
