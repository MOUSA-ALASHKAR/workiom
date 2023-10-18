import 'package:flutter/material.dart';
import 'package:flutter_project/ui/shared/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, this.textSize, this.textColor, this.fontWeight, this.textAlign, this.underLine}) : super(key: key);

  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? underLine;


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Text(
      text,
      style: TextStyle(
        decoration: underLine ?? TextDecoration.none,
        color: textColor ?? AppColors.mainTextColor1,
        fontSize: textSize ?? size.width*0.05,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign,
      textScaleFactor: 1.0,
    );
  }
}
