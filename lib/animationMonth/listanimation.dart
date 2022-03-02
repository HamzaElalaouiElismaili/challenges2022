import 'package:flutter/material.dart';

import 'animationm.dart';



class ListAnimation extends StatefulWidget {
  const ListAnimation({Key? key}) : super(key: key);

  @override
  _ListAnimationState createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title Animation"),),
      body:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(title: const Text("Day 1"), onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AnimationMonth() ));},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
