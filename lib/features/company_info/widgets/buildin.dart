import 'package:flutter/material.dart';

buildInfoColumn(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          textStyle(value, 27,fontWeight: FontWeight.w400),
          textStyle(label, 12),
        ],
      ),
    );
  }

textStyle(String text, double fontSize,
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
  );
}



