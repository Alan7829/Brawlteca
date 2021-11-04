// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class TextBorderWidget extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? colorBack, colorFore;

  const TextBorderWidget({
    Key? key,
    this.text,
    this.fontSize,
    this.colorBack,
    this.colorFore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          this.text ?? "",
          style: TextStyle(
            fontSize: this.fontSize,
            fontFamily: "nougat",
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.5
              ..color = this.colorBack ?? Colors.black,
          ),
        ),
        // Solid text as fill.
        Text(
          this.text ?? "",
          style: TextStyle(
            fontFamily: "nougat",
            fontSize: this.fontSize,
            color: this.colorFore ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
