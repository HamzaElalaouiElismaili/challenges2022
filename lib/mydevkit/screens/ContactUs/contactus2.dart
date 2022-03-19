import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactUs2Page extends StatefulWidget {
  @override
  _ContactUs2PageState createState() => _ContactUs2PageState();
}

class _ContactUs2PageState extends State<ContactUs2Page> {
  final Color _gradientTop = const Color(0xFF039be6);
  final Color _gradientBottom = const Color(0xFF0299e2);
  final Color _mainColor = const Color(0xFF0181cc);
  final Color _underlineColor = const Color(0xFFCCCCCC);

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
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Platform.isIOS?SystemUiOverlayStyle.light:const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light
          ),
          child: Stack(
            children: <Widget>[
              // top blue background gradient
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [_gradientTop, _gradientBottom],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              // set your logo here
              Container(
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 20, 0, 0),
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/logo_dark.png', height: 120)),
              ListView(
                children: <Widget>[
                  // create form login
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.fromLTRB(32, MediaQuery.of(context).size.height / 3.5 - 72, 32, 0),
                    color: Colors.white,
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true).pop();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: _mainColor,
                                    size: 28,
                                  )),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                'CONTACT US',
                                style: TextStyle(
                                    color: _mainColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                                  ),
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                      color: Colors.grey[700])),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: _underlineColor),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.grey[700])),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                                  ),
                                  labelText: 'Message',
                                  labelStyle: TextStyle(
                                      color: Colors.grey[700])),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.maxFinite,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) => _mainColor,
                                    ),
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                        )
                                    ),
                                  ),
                                  onPressed: () {
                                   // Fluttertoast.showToast(msg: 'Click submit', toastLength: Toast.LENGTH_SHORT);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              //Fluttertoast.showToast(msg: 'Click email', toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.email, color: _mainColor),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text('Email'),
                                    const SizedBox(height: 5),
                                    Text('cs@email.com', style: TextStyle(
                                        color: _mainColor,
                                        fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                             // Fluttertoast.showToast(msg: 'Click phone number', toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.phone_android, color: _mainColor),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text('Phone'),
                                    const SizedBox(height: 5),
                                    Text('+62 811 888 888', style: TextStyle(
                                        color: _mainColor,
                                        fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
