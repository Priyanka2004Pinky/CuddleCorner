import 'package:flutter/cupertino.dart';
import 'package:cuddle_corner/Helpers/color_helper.dart';

class PrimaryFont extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight? fontWeight;
  final double fontSize;
  final TextOverflow? overflow;
  final int? maxLines;

  const PrimaryFont({super.key,
  required this.text,
  required this.color,
  this.fontWeight,
  required this.fontSize,
  this.overflow,
  this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'kalamLight',
          fontSize: fontSize,
          overflow: overflow,
      ),
    );
  }
}
