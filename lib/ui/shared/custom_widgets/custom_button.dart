import 'package:flutter/material.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.textColor,
    this.textSize,
    this.textFontWeight,
    this.borderColor,
    this.buttonColor,
    this.svgName,
    required this.onPressed, this.showArrow,

  }) : super(key: key);

  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? borderColor;
  final Color? buttonColor;
  final String? svgName;
  final Function onPressed;
  final bool? showArrow;




  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        ElevatedButton(
          onPressed: (){onPressed();},

          style: ElevatedButton.styleFrom(
            elevation: 0.1,
              side: borderColor != null
                  ? BorderSide(
                  width: 1, color: borderColor ?? AppColors.mainBlueColor)
                  : null,
              backgroundColor: buttonColor ?? AppColors.mainBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(22)
              ),
              fixedSize: Size(screenWidth(1.1), screenWidth(6.5))),


          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svgName != null) ...[
                SvgPicture.asset('images/$svgName.svg' , width: screenWidth(25),),
                SizedBox(
                  width: screenWidth(30),
                )
              ],
              Text(
                text,
                style: TextStyle(
                    color: textColor ?? AppColors.mainWhiteColor,
                    fontSize: textSize ?? screenWidth(25),
                    fontWeight: textFontWeight ?? FontWeight.normal),
              ),
            ],
          ),
        ),
         showArrow == true ? Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Container(
            margin: EdgeInsetsDirectional.only(top: screenWidth(20) , end: screenWidth(12)),
            width: screenWidth(13),
            height: screenWidth(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.mainWhiteColor.withOpacity(0.2)
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth(100)),
              child: SvgPicture.asset('images/arrow.svg' , color: Colors.white,),
            ),
          ),
        ) : SizedBox.shrink(),
      ],
    );
  }
}

