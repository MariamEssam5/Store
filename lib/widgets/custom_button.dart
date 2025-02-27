import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, required this.text});
  String text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
