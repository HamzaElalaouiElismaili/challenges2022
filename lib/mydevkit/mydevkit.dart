import 'package:challenges2022/mydevkit/screens/ContactUs/contactus1.dart';
import 'package:challenges2022/mydevkit/screens/ContactUs/contactus2.dart';
import 'package:challenges2022/mydevkit/screens/ForgotPassword/forgot_password1.dart';
import 'package:challenges2022/mydevkit/screens/ForgotPassword/forgot_password2.dart';
import 'package:challenges2022/mydevkit/screens/ForgotPassword/forgot_password3.dart';
import 'package:challenges2022/mydevkit/screens/ForgotPassword/forgot_password4.dart';
import 'package:challenges2022/mydevkit/screens/signin/signin1.dart';
import 'package:challenges2022/mydevkit/screens/signin/signin2.dart';
import 'package:challenges2022/mydevkit/screens/signin/signin3.dart';
import 'package:challenges2022/mydevkit/screens/signin/signin4.dart';
import 'package:challenges2022/mydevkit/screens/signup/signup1.dart';
import 'package:challenges2022/mydevkit/screens/signup/signup2.dart';
import 'package:challenges2022/mydevkit/screens/signup/signup3.dart';
import 'package:challenges2022/mydevkit/screens/signup/signup4.dart';
import 'package:challenges2022/mydevkit/screens/timeline/timeline1.dart';
import 'package:challenges2022/mydevkit/screens/user/user1.dart';
import 'package:challenges2022/mydevkit/screens/user_profile/user_profile1.dart';
import 'package:challenges2022/mydevkit/screens/user_profile/user_profile2.dart';
import 'package:challenges2022/mydevkit/screens/user_profile/user_profile3.dart';
import 'package:flutter/material.dart';





class ListDevKit extends StatefulWidget {
  const ListDevKit({Key? key}) : super(key: key);

  @override
  _ListDevKitState createState() => _ListDevKitState();
}

class _ListDevKitState extends State<ListDevKit> {
  @override
  Widget build(BuildContext context) {

    Widget myListTile({required String title, required Widget route})
    {
      return  Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(title:  Text(title), onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  route ));},
        ),
      );

    }
    return Scaffold(
      appBar: AppBar(title: const Text("DevKit"),),
      body:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                //  ContactUs
               myListTile(title: "contactus 1", route: ContactUs1Page()),
               myListTile(title: "contactus 2", route: ContactUs2Page()),
                //  Forgot Password
                myListTile(title: "Forgot Password 1", route: ForgotPassword1Page()),
                myListTile(title: "Forgot Password 2", route: ForgotPassword2Page()),
                myListTile(title: "Forgot Password 3", route: ForgotPassword3Page()),
                myListTile(title: "Forgot Password 4", route: ForgotPassword4Page()),

                myListTile(title: "Signup 1", route: Signup1Page()),
                myListTile(title: "Signup 2", route: Signup2Page()),
                myListTile(title: "Signup 3", route: Signup3Page()),
                myListTile(title: "Signup 4", route: Signup4Page()),

                myListTile(title: "Signin 1", route: Signin1Page()),
                myListTile(title: "Signin 2", route: Signin2Page()),
                myListTile(title: "Signin 3", route: Signin3Page()),
                myListTile(title: "Signin 4", route: Signin4Page()),

                myListTile(title: "Timaline 1 ", route: Timeline1Page()),

                myListTile(title: "User Page 1", route: User1Page()),

                myListTile(title: "User Profile 1", route: UserProfile1Page()),
                myListTile(title: "User Profile 2", route: UserProfile2Page()),
                myListTile(title: "User Profile 2", route: UserProfile3Page()),

              ],
            ),
          )
        ],
      ),
    );
  }
}
