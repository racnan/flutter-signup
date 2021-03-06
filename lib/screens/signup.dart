import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../components/GradientButton.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height.roundToDouble();
    final screenWidth = MediaQuery.of(context).size.width.roundToDouble();
    print(screenWidth.toString() + screenHeight.toString());
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      //appBar: customAppBar("Sign Up"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              //color: Colors.red,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: upperText(screenHeight)),
          Container(
              //color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: MyFormField()),
          lowerText(screenWidth, context),
          // SizedBox(
          //   height: screenHeight * 0.1,
          // )
        ]),
      ),
    );
  }

  Widget lowerText(double screenWidth, BuildContext context) {
    return Container(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Already have an account? ",
            style:
                (TextStyle(fontSize: screenWidth * 0.04, color: Colors.black))),
        TextSpan(
            text: "Login",
            style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () => {Navigator.pop(context)})
      ])),
    );
  }

  Widget upperText(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            //color: Colors.red,
            child: Text(
              "Create Account,",
              style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            width: double.infinity,
            //color: Colors.blue,
            child: Text(
              "Sign up to get started!",
              style: TextStyle(
                  fontSize: 22, //screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
        ],
      ),
    );
  }
}

class MyFormField extends StatefulWidget {
  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  final _formkey = GlobalKey<FormState>();

  Widget singleTextField(String text, double height) {
    return Container(
      //color: Colors.amber,
      width: double.infinity,
      height: height * 0.1,
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: text,
            border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter some text";
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height.roundToDouble();
    final screenWidth = MediaQuery.of(context).size.width.roundToDouble();
    return Form(
      key: _formkey,
      child: Column(
        children: [
          singleTextField("Full Name", screenHeight),
          singleTextField("Username", screenHeight),
          singleTextField("Email", screenHeight),
          singleTextField("Password", screenHeight),
          GradientButton(
              width: screenWidth,
              height: screenHeight,
              onPressed: () => {},
              gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.grey],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              text: "Sign Up"),
        ],
      ),
    );
  }
}
