import 'package:flutter/material.dart';

import 'following_list.dart';

class FollowingList extends StatefulWidget {
  const FollowingList({Key? key}) : super(key: key);

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation:0,title:const Text("Followers"), centerTitle: true,backgroundColor: Colors.indigoAccent.shade100,),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child:  FollowingListBuilder(),
      ),
    );
  }
}
