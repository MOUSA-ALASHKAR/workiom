import 'package:flutter/material.dart';
import 'package:flutter_project/app/my_app.dart';
import 'package:flutter_project/core/translations/app_translations.dart';
import 'package:flutter_project/core/utils/general_util.dart';
import 'package:flutter_project/ui/shared/colors.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_project/ui/shared/custom_widgets/workiom_widget.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:flutter_project/ui/views/signin_view/signin_controller.dart';
import 'package:flutter_project/ui/views/signin_view/signin_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {

  SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(15) , start: screenWidth(25)),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios , color: AppColors.mainBlueColor , size: screenWidth(15),),
                    Text(tr('sign_in') , style: TextStyle(color: AppColors.mainBlueColor , fontSize: screenWidth(20)),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.only(start: screenWidth(20) , top: screenWidth(15) , bottom: screenWidth(20)),
                child: CustomText(text: tr('create_account') , fontWeight: FontWeight.bold , textSize: screenWidth(20),),
              ),

              Padding(
                padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
                child: Row(
                  children: [
                    CustomText(text: tr('hey_key') , textSize: screenWidth(25),),
                    SizedBox(width: screenWidth(75)),
                    SvgPicture.asset('images/hey.svg'),
                  ],
                ),
              ),

              Spacer(),

              Obx(() {
                return controller.passwordModel.value.result == null ? SpinKitCircle(color: AppColors.mainBlueColor,size: 0.0,) :
                Center(child: Text(controller.passwordModel.value.result!.setting!.requiredLength.toString() , style: TextStyle(fontSize: 0.0),));
              }),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(25) , vertical: screenWidth(25)),
                child: CustomButton(
                  onPressed: (){},
                  text: tr('sign_with_google'),
                  svgName: 'google_svg',
                  buttonColor: Colors.white54.withOpacity(0.75),
                  textColor: Colors.black,
                  textFontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(22) , bottom: screenWidth(22)),
                child: Center(child: CustomText(text: tr('or') , textColor: AppColors.PlaceholderColor,)),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(25) , vertical: screenWidth(25)),
                child: CustomButton(
                  onPressed: (){
                    controller.passwordModel.value.result!.setting!.requiredLength == null ? null : Get.to(SignInView());
                  },
                  showArrow: true,
                  text: tr('sign_with_email'),
                  buttonColor: AppColors.mainBlueColor,
                  textColor: Colors.white,
                  textFontWeight: FontWeight.bold,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: tr('terms_1') , textSize: screenWidth(30),),
                  CustomText(text: tr('terms_2') , textSize: screenWidth(30) , underLine: TextDecoration.underline,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: tr('and') , textSize: screenWidth(30)),
                  CustomText(text: tr('privacy_policy') , textSize: screenWidth(30) , underLine: TextDecoration.underline,),
                ],
              ),

              Spacer(),

              Padding(
                padding: EdgeInsetsDirectional.only(bottom: screenWidth(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('images/language.svg' , width: screenWidth(22),),
                    SizedBox(width: screenWidth(75)),
                    CustomText(text: tr('language_state') , textSize: screenWidth(25),),
                    InkWell(
                      onTap: (){
                        Get.defaultDialog(
                            title: tr('language'),
                            titleStyle: TextStyle(color: Colors.black),
                            content: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      storage.setAppLanguage('en');
                                      Get.updateLocale(getLocal());
                                      Get.back();
                                    },
                                    child: Text('English')),
                                TextButton(
                                    onPressed: () {
                                      storage.setAppLanguage('ar');
                                      Get.updateLocale(getLocal());
                                      Get.back();
                                    },
                                    child: Text('العربية')),
                              ],
                            )
                        );
                      },
                        child: Icon(Icons.arrow_drop_down_rounded)
                    )
                  ],
                ),
              ),

              WorkiomWidget(),

              SizedBox(height: screenWidth(10),),

            ],
          ),
        ),
    );
  }
}
