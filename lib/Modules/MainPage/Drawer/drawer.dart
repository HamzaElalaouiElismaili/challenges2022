import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.2 ,right: 0.2 ),
      child: Align(
        alignment:Alignment.centerLeft,
        child: Container(
          color:   Colors.indigo[100],
          height: double.maxFinite,
          width: MediaQuery.of(context).size.width-150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:  [
              Row(
                children:  [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13,vertical: 15),
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(me),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2- 40,
                    child: const Text(
                      "Hi , Hamza El ALAOUI EL ISMAILI",overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15,),
              Expanded(child: drawerNavigation(iconData: Icons.dashboard, colorText: Colors.black, text: "Dashboard", backgroundColor: Colors.transparent,)),
              Expanded(child: drawerNavigation(iconData: Icons.message, colorText: Colors.black, text: "Messages", backgroundColor: Colors.transparent,)),
              Expanded(child: drawerNavigation(iconData: Icons.today_outlined, colorText: Colors.black, text: "Calendar", backgroundColor: Colors.transparent,)),
              Expanded(child: drawerNavigation(iconData: Icons.lock, colorText: Colors.black, text: "Privacy", backgroundColor: Colors.transparent,)),

              const Spacer(),
              const ListTile(
                leading:  Icon(Icons.logout),
                title:  Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget drawerNavigation({required String text,required Color colorText, required IconData iconData ,required Color backgroundColor})
{
  return  GestureDetector(
    onTap: ()=> debugPrint(text),
    child: Container(
      child: RotatedBox(quarterTurns: 3,child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Expanded(child: Text(text,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: colorText),)),
            Expanded(child: Icon(iconData)),

          ],
        ),
      )),
      height: 150,
      width: 50,
      color:backgroundColor,
    ),
  );


}