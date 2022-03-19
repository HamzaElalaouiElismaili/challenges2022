import 'package:flutter/material.dart';

class Signin4Page extends StatefulWidget {
  @override
  _Signin4PageState createState() => _Signin4PageState();
}

class _Signin4PageState extends State<Signin4Page> {
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  final Color _underlineColor = const Color(0xFFCCCCCC);
  final Color _mainColor = const Color(0xFF07ac12);
  final Color _color1 = const Color(0xFF515151);
  final Color _color2 = const Color(0xff777777);
  final Color _color3 = const Color(0xFFaaaaaa);

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

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
            Text('Sign In', style: TextStyle(
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
              height: 20,
            ),
            TextField(
              obscureText: _obscureText,
              style: TextStyle(color: _color1),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _mainColor, width: 2.0)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _underlineColor),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: _color2),
                suffixIcon: IconButton(
                    icon: Icon(_iconVisible, color: Colors.grey[400], size: 20),
                    onPressed: () {
                      _toggleObscureText();
                    }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                     // Fluttertoast.showToast(msg: 'Click forgot password', toastLength: Toast.LENGTH_SHORT);
                      FocusScope.of(context).unfocus();
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: _mainColor, fontSize: 13),
                    ),
                  ),
                )),
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
                 // Fluttertoast.showToast(msg: 'Click login', toastLength: Toast.LENGTH_SHORT);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'LOGIN',
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
              child: Text(
                'Or sign in with',
                style: TextStyle(
                    fontSize: 13,
                    color: _color3
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    //  Fluttertoast.showToast(msg: 'Signin with google', toastLength: Toast.LENGTH_SHORT);
                    },
                    child: const Image(
                      image: AssetImage("assets/images/google.png"), width: 40,),
                  ),
                  GestureDetector(
                    onTap: (){
                     // Fluttertoast.showToast(msg: 'Signin with facebook', toastLength: Toast.LENGTH_SHORT);
                    },
                    child: const Image(
                      image: AssetImage("assets/images/facebook.png"), width: 40,),
                  ),
                  GestureDetector(
                    onTap: (){
                    //  Fluttertoast.showToast(msg: 'Signin with twitter', toastLength: Toast.LENGTH_SHORT);
                    },
                    child: const Image(
                      image: AssetImage("assets/images/twitter.png"), width: 40,),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  //Fluttertoast.showToast(msg: 'Click signup', toastLength: Toast.LENGTH_SHORT);
                  FocusScope.of(context).unfocus();
                },
                child: Wrap(
                  children: [
                    Text(
                      'No account yet? ',
                      style: TextStyle(
                          fontSize: 13,
                          color: _color3
                      ),
                    ),
                    Text(
                      'Create one',
                      style: TextStyle(
                          fontSize: 13,
                          color: _mainColor
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
