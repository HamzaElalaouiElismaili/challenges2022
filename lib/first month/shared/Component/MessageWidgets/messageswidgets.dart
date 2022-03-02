
import 'package:challenges2022/first%20month/Modeles/msgmodel.dart';
import 'package:flutter/material.dart';

Widget bubbleMyMessage(MessageModel model) {
  if (model.messageimage == '') {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.5),
          decoration: BoxDecoration(
              color: Colors.indigoAccent.shade100,
              borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10),
                topEnd:  Radius.circular(10),
                topStart: Radius.circular(10),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.text!,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          )),
    );
  } else if (model.messageimage != '' && model.text != '') {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(30),
            topEnd:  Radius.circular(30),
            topStart: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              child: Image(
                image: NetworkImage('${model.messageimage}'),
                fit: BoxFit.cover,
              ),
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        model.text!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart:  Radius.circular(20),
              topEnd:  Radius.circular(20),
              topStart:  Radius.circular(20),
            ),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${model.messageimage}')),
          )),
    );
  }
}

Widget bubbleOtherMessage(MessageModel model) {
  if (model.messageimage == '') {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.5),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd:  Radius.circular(10),
                topEnd:  Radius.circular(10),
                topStart: Radius.circular(10),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.text!,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          )),
    );
  } else if (model.messageimage != '' && model.text != '') {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(30),
            topEnd: Radius.circular(30),
            topStart: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image(
                image: NetworkImage('${model.messageimage}'),
                fit: BoxFit.cover,
              ),
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        model.text!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${model.messageimage}')),
          )),
    );
  }
}