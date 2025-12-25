import 'package:dinacomapp/Components/custom_color.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String myText;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;
  final String fontFamily; // ⬅️ TAMBAHAN
  final String? controller;

  const CustomText({
    super.key,
    required this.myText,
    this.fontColor = CustomColor.tekscolor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.align = TextAlign.start,
    this.fontFamily = 'Dela Gothic One', // ⬅️ DEFAULT
    this.controller, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        myText,
        textAlign: align,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily, // ⬅️ PAKAI
        ),
      ),
    );
  }
}
