import 'package:flutter/material.dart';
import 'package:login/constants.dart';

Future<void> showMyDialog(context, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsOverflowDirection: VerticalDirection.up,
        elevation: 3,
        content: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 20, color: dark),
                ),
              ),
              Row(
                mainAxisAlignment: message == 'Change Password?'
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.center,
                children: [
                  message == 'Change Password?'
                      ? DialogButton(text: 'Yes')
                      : SizedBox(),
                  DialogButton(
                      text: message == 'Change Password?' ? 'No' : 'Ok')
                ],
              )
            ],
          )),
        )),
      );
    },
  );
}

class DialogButton extends StatelessWidget {
  const DialogButton({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
          color: dark, borderRadius: BorderRadius.all(Radius.circular(8))),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        onPressed: () {
          //Page Navigation
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
