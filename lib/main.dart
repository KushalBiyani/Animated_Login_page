import 'package:flutter/material.dart';
import 'package:login/components/animatedCircle.dart';
import 'package:login/components/dialogBox.dart';
import 'package:login/constants.dart';
import 'package:login/functions/loginFunction.dart';

import 'components/Mycliper.dart';

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
  bool checkBox = false;
  TextEditingController mobileNo = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text('Login', style: kloginTextStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Mobile No.', style: ktextfieldlable),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    height: 55,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: TextField(
                          cursorColor: light,
                          controller: mobileNo,
                          keyboardType: TextInputType.number,
                          decoration: ktextFieldStyle),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Password', style: ktextfieldlable),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    height: 55,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: TextField(
                          controller: password,
                          obscureText: true,
                          cursorColor: light,
                          decoration: ktextFieldStyle),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?', style: ksmallColorText)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22,
                          width: 22,
                          margin: EdgeInsets.only(right: 10),
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
                        onPressed: () async {
                          if (checkBox) {
                            if (mobileNo.text.length == 10 &&
                                password.text.length >= 8) {
                              int status =
                                  await login(mobileNo.text, password.text);
                              print(status);
                              if (status == 200) {
                                showMyDialog(context, 'Change Password?');
                              } else {
                                showMyDialog(context, 'Invalid Credentials');
                              }
                            } else {
                              showMyDialog(
                                  context, 'Credentials are too short');
                            }
                          } else {
                            showMyDialog(context, 'Accept the Policy');
                          }
                        },
                        child: Text('Sign In',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
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
