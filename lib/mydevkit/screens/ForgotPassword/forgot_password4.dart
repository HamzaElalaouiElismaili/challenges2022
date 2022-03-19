import 'package:flutter/material.dart';

class ForgotPassword4Page extends StatefulWidget {
  @override
  _ForgotPassword4PageState createState() => _ForgotPassword4PageState();
}

class _ForgotPassword4PageState extends State<ForgotPassword4Page> {
  final Color _underlineColor = const Color(0xFFCCCCCC);
  final Color _mainColor = const Color(0xFF07ac12);
  final Color _color1 = const Color(0xFF515151);
  final Color _color2 = const Color(0xff777777);
  final Color _color3 = const Color(0xFFaaaaaa);

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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(30, 120, 30, 30),
          children: <Widget>[
            Center(
                child: Image.asset('assets/images/logo_horizontal.png', color: _mainColor, height: 30)),
            const SizedBox(
              height: 80,
            ),
            Text('Forgot Password', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: _mainColor
            )),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: _color1),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _mainColor, width: 2.0)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _underlineColor),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: _color2),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'We will send the instruction to reset your password through the email',
              style: TextStyle(
                  fontSize: 14,
                  color: _color3
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
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
                  //Fluttertoast.showToast(msg: 'Click reset password', toastLength: Toast.LENGTH_SHORT);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                 // Fluttertoast.showToast(msg: 'Click back to login', toastLength: Toast.LENGTH_SHORT);
                  FocusScope.of(context).unfocus();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.arrow_back,
                        size: 16,
                        color: _mainColor
                    ),
                    Text(
                      ' Back to login',
                      style: TextStyle(
                          color: _mainColor,
                          fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
