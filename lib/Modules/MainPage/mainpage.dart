import 'package:challenges2022/shared/Component/HomeScreenWidgets/homescreenwidgets.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Drawer/drawer.dart';
import 'HomePage/homepage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height  = 0;
  double width  = 0;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children:  [
           // test1(context),
           // test2(context),
            Container(color: Colors.indigo[100],),
            DrawerPage(),
            HomePage()

          ],
        ),
      )
    );
  }



}


bool isDrawer = true;
