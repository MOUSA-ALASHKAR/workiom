import 'package:flutter/material.dart';
import 'package:flutter_project/core/translations/app_translations.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkiomWidget extends StatelessWidget {
  const WorkiomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: tr('workiom_1') , textSize: screenWidth(25),),
        SvgPicture.asset('images/workiom_logo.svg' , width: screenWidth(15),),
        CustomText(text: tr('workiom_2') , fontWeight: FontWeight.bold , textSize: screenWidth(25),),
      ],
    );
  }
}
