import 'package:challenges2022/shared/Component/HomeScreenWidgets/homescreenwidgets.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:flutter/material.dart';

import '../mainpage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? height  ;
  double? width  ;
  double myRadius = 0 ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     height = size.height;
     width = size.width;

     return AnimatedPositioned(
       duration: const  Duration(milliseconds: 300),
       curve: Curves.easeInCirc,
       top: isDrawer ? 0: 0.1* height!,
       bottom:  isDrawer ? 0: 0.17* width!,
       left:  isDrawer ? 0: 0.12* width!,// left:  isDrawer ? 0: 0.12* width!,
       right: isDrawer ? 0: -0.6* width!,

       child: Container(
         clipBehavior: Clip.antiAliasWithSaveLayer,
         decoration: BoxDecoration(
           color: Colors.orange[100],
               borderRadius: BorderRadius.circular(myRadius),
         ),
        child: Column(
          children: [
            customAppBar(menuPressed: ()
            {
              setState(()
              {
                isDrawer = !isDrawer;
                if (isDrawer==false)
                {
                  myRadius = 20;
                  debugPrint("$myRadius");

                }else
                  {
                    myRadius = 0;

                  }

                debugPrint("$isDrawer");
              });
            }

            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hi , Bro"),
                  Text("this  you're  :  ${uId!}"),
                ],
              ),
            ),
            const  Spacer(),
            customBottomNavigationBar(),
          ],
        ),
    ),
     );
  }
}
