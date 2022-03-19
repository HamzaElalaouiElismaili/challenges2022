import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword1Page extends StatefulWidget {
  @override
  _ForgotPassword1PageState createState() => _ForgotPassword1PageState();
}

class _ForgotPassword1PageState extends State<ForgotPassword1Page> {
  final Color _backgroundColor = const Color(0xFFE43F3F);
  final Color _underlineColor = const Color(0xFFCCCCCC);
  final Color _buttonColor = const Color(0xFFCC1D1D);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _backgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Platform.isIOS?SystemUiOverlayStyle.light:const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light
          ),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(32, 72, 32, 24),
            children: [
              Container(
                child: Image.asset('assets/images/logo_dark.png', height: 120),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _underlineColor),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('We will send the instruction to reset your password through the email', style: TextStyle(
                fontSize: 14, color: Colors.white
              )),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) => _buttonColor,
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        )
                    ),
                  ),
                  onPressed: () {
                    //Fluttertoast.showToast(msg: 'Click reset password', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'RESET PASSWORD',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                   // Fluttertoast.showToast(msg: 'Click back to login', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.arrow_back, size: 16, color: Colors.white),
                      Text(' Back to login', style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
