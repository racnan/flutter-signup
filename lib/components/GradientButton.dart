import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;
  final Gradient gradient;
  final String text;
  GradientButton(
      {@required this.width,
      @required this.height,
      @required this.onPressed,
      @required this.gradient,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      //margin: EdgeInsets.all(10),
      width: double.infinity,
      height: height * 0.06,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: InkWell(
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
        )),
        onTap: onPressed,
      ),
    );
  }
}
