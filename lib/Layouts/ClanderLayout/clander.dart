import 'package:flutter/material.dart';


class Calender extends StatelessWidget {
  final Widget appbar;

  const Calender({Key? key ,required this.appbar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appbar,
          Text("Calender ..."),
          SizedBox(height: 30,),
          Icon(Icons.calendar_today_sharp,size: 50,)
        ],
      ),
    );
  }
}
