import 'package:challenges2022/Layouts/SearchLayout/searchdelegate.dart';
import 'package:challenges2022/Modules/MainPage/mainpage.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/shared/SearchWidgets/searchwidgets.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final Widget appbar;
   int index;

   Messages({Key? key ,required  this.appbar,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async {
        index = 0;
        goBackMaybe(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(child: appbar, color: Colors.redAccent[100],),
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
      ),
    );
  }
}
