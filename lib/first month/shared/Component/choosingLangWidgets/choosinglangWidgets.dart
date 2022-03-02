
import 'package:flutter/material.dart';

Widget choosingLang({Function? onTap, BoxDecoration? decoration, double? opacity, required String path, required String lang, bool? selectable})
{
  return InkWell(
    onTap: () => onTap!(),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
      decoration: decoration ,
      child: ListTile(
        leading: Image.asset(path,height: 30,width: 30,),
        title:  Center(child: Text(lang)),
        trailing: selectable! ? const Opacity(opacity: 1, child:  Icon(Icons.check_circle ,color: Colors.green,),):const Opacity(opacity: 0, child:  Icon(Icons.check_circle ,color: Colors.green,),) ,
      ),
    ),
  );
}


Widget langChoosingButton(
    {required String textButton,
      required Function() functionPressing,
      required ButtonStyle styleButton}) {
  return SizedBox(
    height: 60,
    width: double.maxFinite,
    child: ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textButton,
          style: const TextStyle(
              fontWeight: FontWeight.bold,height: 1, fontFamily: "Cairo", fontSize: 23 , color: Colors.black),
        ),
      ),
      style: styleButton,
      onPressed: functionPressing,
    ),
  );
}

