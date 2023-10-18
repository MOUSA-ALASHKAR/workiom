import 'package:flutter/material.dart';
import 'package:flutter_project/core/translations/app_translations.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_project/ui/shared/custom_widgets/workiom_widget.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:flutter_svg/svg.dart';

class EndView extends StatelessWidget {
  const EndView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Spacer(),

              Padding(
                padding: EdgeInsetsDirectional.only(start: screenWidth(5)),
                child: CustomText(
                  text: tr('workiom_thank_1'),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: screenWidth(5)),
                child: Row(
                  children: [
                    CustomText(
                      text: tr('workiom_thank_2'),
                      fontWeight: FontWeight.bold,
                    ),
                    SvgPicture.asset('images/workiom_logo.svg'),
                  ],
                ),
              ),

              Spacer(),

              Padding(
                padding: EdgeInsets.only(bottom: screenWidth(10) , top: screenWidth(3)),
                child: WorkiomWidget(),
              ),


            ],
          ),
        )
    );
  }
}
