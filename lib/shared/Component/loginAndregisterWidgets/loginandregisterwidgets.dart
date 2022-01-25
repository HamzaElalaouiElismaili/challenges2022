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
              suffixPressed!();
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
      onFieldSubmitted: (value) => onSubmit!(value),
      onTap: () => onTap!(),
      keyboardType: type,
    ),
  );
}

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
              fontWeight: FontWeight.bold, fontSize: 25),
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

Widget registerButton(
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
              fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      style: styleButton,
      onPressed: functionPressing,
    ),
  );
}

Widget errorBar({required BuildContext context, required String errorType, required void Function() onTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
    child: Stack(
      children: [
        Container(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.of(context).size.width - 100, end: 5),
              child: GestureDetector(
                  onTap: onTap,
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 25,
                  ),
              ),
            ),
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20))),
        Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(errorType,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white)),
            ),
            height: 50,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20))),
      ],
    ),
  );
}

Widget updateProfileButton(
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
              fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      style: styleButton,
      onPressed: functionPressing,
    ),
  );
}



Widget completeInfoButton(
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
              fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      style: styleButton,
      onPressed: functionPressing,
    ),
  );
}