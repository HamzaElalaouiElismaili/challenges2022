import 'package:flutter/material.dart';


class Privacy extends StatelessWidget {
  final Widget appbar;
  const Privacy({Key? key, required this.appbar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appbar,
          Text("Privacy ..."),
          SizedBox(height: 30,),
          Icon(Icons.lock_outline,size: 50,)
        ],
      ),
    );
  }
}
