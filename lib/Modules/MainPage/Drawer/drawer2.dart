import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:flutter/material.dart';

class DrawerPage2 extends StatefulWidget {
  const DrawerPage2({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment:Alignment.centerLeft,
        child: SizedBox(
          height: double.maxFinite,
          width: MediaQuery.of(context).size.width-150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:  [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(me),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Hamza El ALAOUI EL ISMAILI",overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "El Jadida , Morocco",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                      height: 1),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.white60,
                child: const ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text("Dashboard"),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.message),
                title: const Text("Messages"),
              ),
              const ListTile(
                leading: Icon(Icons.today_outlined),
                title: const Text("Calendar"),
              ),
              const ListTile(
                leading: Icon(Icons.lock),
                title: const Text("Privacy"),
              ),
              const Spacer(),
              const ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
