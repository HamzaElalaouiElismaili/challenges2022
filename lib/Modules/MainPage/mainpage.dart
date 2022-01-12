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
          children:
          [
          Container(color: Colors.indigo[100],),
          // const DrawerPage2(),
          const  DrawerPage(),
          const  HomePage()

          ],
        ),
      )
    );
  }



}


bool isDrawer = true;
