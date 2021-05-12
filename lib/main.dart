import 'package:flutter/material.dart';
import 'package:login/animatedCircle.dart';
import 'package:login/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(unselectedWidgetColor: light),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    bool checkBox = false;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: light),
      body: Container(
        color: light,
        height: double.infinity,
        child: Stack(children: [
          ClipPath(
            clipper: MyClipper(true),
            child: Container(
              color: dark,
            ),
          ),
          ClipPath(
            clipper: MyClipper(false),
            child: Container(
              color: Colors.white,
            ),
          ),
          Center(
            child: Container(
              width: width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 26,
                          color: light,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Mobile No.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    height: 55,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: TextField(
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusColor: light,
                          contentPadding: EdgeInsets.only(
                              left: 14.0, bottom: 3.0, top: 3.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    height: 55,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: TextField(
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusColor: light,
                          hoverColor: light,
                          contentPadding: EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?', style: ksmallColorText)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22,
                          padding: EdgeInsets.only(right: 10),
                          width: 32,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: checkBox ? light : Colors.transparent,
                                  width: 2.3),
                            ),
                            child: Checkbox(
                              checkColor: light,
                              activeColor: Colors.transparent,
                              tristate: false,
                              value: checkBox,
                              onChanged: (bool value) {
                                setState(() {
                                  checkBox = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Text(
                          'By loging in, I accept the Privacy \nPolicy and Terms of Servies of \nPower2Create.',
                          style: TextStyle(
                              fontSize: 14.5, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: dark,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('Need Assistance?', style: ksmallColorText),
                  ),
                ],
              ),
            ),
          ),
          Stack(children: [
            Positioned(
              child: GlowCircle(true),
              bottom: -30,
              right: 150,
            ),
            Positioned(
              child: GlowCircle(false),
              bottom: -30,
              left: -30,
            ),
          ])
        ]),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  MyClipper(this.IsDark);
  final bool IsDark;
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(0, size.height * 0.75, 0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * (IsDark ? 0.40 : 0.50),
        size.height * (IsDark ? 0.60 : 0.55),
        size.width,
        (IsDark ? 0.67 : 0.60) * size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
