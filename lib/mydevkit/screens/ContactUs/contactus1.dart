import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class ContactUs1Page extends StatefulWidget {
  @override
  _ContactUs1PageState createState() => _ContactUs1PageState();
}

class _ContactUs1PageState extends State<ContactUs1Page> {
  final Color _color1 = const Color(0xFF005288);
  final Color _color2 = const Color(0xFF37474f);
  final Color _color3 = const Color(0xFF78909c);

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
        appBar: AppBar(
          title: const Text('Contact Us'),
          backgroundColor: _color1,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('You can contact us for suggestions, testimonials by filling in the form below :', style: TextStyle(
                      fontSize: 14, color: _color2
                  )),
                  TextField(
                    style: TextStyle(color: _color2),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: _color1, width: 1.0)),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                        ),
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontSize: 12, color: _color3
                        )
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: _color2),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: _color1, width: 1.0)),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontSize: 12, color: _color3
                        )
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    minLines: 1,
                    maxLines: null,
                    style: TextStyle(color: _color2),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: _color1, width: 1.0)),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: 'WRITE MESSAGE',
                        labelStyle: TextStyle(
                            fontSize: 12, color: _color3
                        )
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) => _color1,
                          ),
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              )
                          ),
                        ),
                        onPressed: () {
                          // Fluttertoast.showToast(msg: 'Click send', toastLength: Toast.LENGTH_SHORT);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'SEND',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: (){
                //Fluttertoast.showToast(msg: 'Click call center', toastLength: Toast.LENGTH_SHORT);
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal:16, vertical: 8),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: _color1),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CALL CENTER', style: TextStyle(
                              color: _color3, fontSize: 14
                          )),
                          const SizedBox(height: 2),
                          Text('+123 456 789', style: TextStyle(
                              color: _color1, fontSize: 16, fontWeight: FontWeight.bold
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()
              {
                //Fluttertoast.showToast(msg: 'Click sms hotline', toastLength: Toast.LENGTH_SHORT);
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal:16, vertical: 8),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: _color1),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('SMS HOTLINE', style: TextStyle(
                              color: _color3, fontSize: 14
                          )),
                          const SizedBox(height: 2),
                          Text('0811 888 999', style: TextStyle(
                              color: _color1, fontSize: 16, fontWeight: FontWeight.bold
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
