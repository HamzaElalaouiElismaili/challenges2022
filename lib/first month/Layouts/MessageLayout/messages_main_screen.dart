import 'package:challenges2022/first%20month/Layouts/SearchLayout/searchdelegate.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/SearchWidgets/searchwidgets.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {

  const Messages({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: searchBar(onTab:()=> goTo(context,const FriendSearch()),),
             ),
             const Text("Messages ..."),
             const SizedBox(height: 30,),
             const Icon(Icons.message_outlined,size: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
