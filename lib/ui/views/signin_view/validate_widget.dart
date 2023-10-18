import 'package:flutter/material.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:flutter_svg/svg.dart';

class ValidateForm extends StatefulWidget {
  const ValidateForm({Key? key, this.svgName, this.text, this.fontWeight}) : super(key: key);
  final String? svgName;
  final String? text;
  final FontWeight? fontWeight;

  @override
  State<ValidateForm> createState() => _ValidateFormState();
}

class _ValidateFormState extends State<ValidateForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: screenWidth(20) , bottom: screenWidth(80)),
      child: Row(
        children: [
          SvgPicture.asset('images/${widget.svgName}.svg' , width: screenWidth(30),),
          SizedBox(width: screenWidth(50)),
          CustomText(text: widget.text ?? '',textSize: screenWidth(30) , fontWeight: widget.fontWeight,),
        ],
      ),
    );
  }
}
