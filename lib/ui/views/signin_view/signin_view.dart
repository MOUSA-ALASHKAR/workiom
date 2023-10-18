import 'package:flutter/material.dart';
import 'package:flutter_project/core/translations/app_translations.dart';
import 'package:flutter_project/ui/shared/colors.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_project/ui/shared/custom_widgets/workiom_widget.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:flutter_project/ui/views/landing_view/landing_view.dart';
import 'package:flutter_project/ui/views/signin_view/signin_controller.dart';
import 'package:flutter_project/ui/views/signin_view/validate_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  SignInController controller = Get.put(SignInController());

  @override
  void dispose() {
    controller.pageIndex.value =1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: screenWidth(25) , top: screenWidth(25)),
                  child: InkWell(
                      onTap: (){ controller.pageIndex.value = 1; Get.offAll(LandingView()); },
                      child: Icon(Icons.arrow_back_ios , color: AppColors.mainBlueColor , size: screenWidth(12),)),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(start: screenWidth(20) , top: screenWidth(15) , bottom: screenWidth(20)),
                  child: CustomText(text: tr('strong_password') , fontWeight: FontWeight.bold , textSize: screenWidth(20),),
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

                SizedBox(height: screenWidth(4)),

                Obx(() { print(controller.pageIndex);
                  return
                    controller.pageIndex.value == 1 ?
                        FormOne(context) :  FormTow(context);
                }
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(start: screenWidth(22) , top: screenWidth(20)),
                  child: Obx(() {
                    return  CustomButton(
                      showArrow: true,
                      buttonColor:
                      controller.checkPassword() ?
                      AppColors.mainBlueColor : AppColors.PlaceholderColor,

                      onPressed: () {
                        controller.checkPassword() ? controller.pageIndex == 2 && controller.isEmpty() ?
                        controller.checkTenant() : controller.nextPage() : null;
                      },
                      text: controller.pageIndex.value == 1 ? tr('confirm_password') : tr('create_workspace'),
                    );
                  }
                  ),
                ),

                SizedBox(height: screenWidth(4)),

                WorkiomWidget(),

                SizedBox(height: screenWidth(10)),

              ],
            ),
          ),
        ),
    );
  }



  Widget FormTow(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
          child: CustomText(text: tr('company_name') , textSize: screenWidth(30),),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: screenWidth(50)),
          child: Row(
            children: [
              SizedBox(width: screenWidth(20),),
              SvgPicture.asset('images/groupe.svg' , width: screenWidth(18),),
              Expanded(
                child: CustomTextField(
                  controller: controller.companyController,
                  hitText: tr('company_hint'),
                  update: (){setState(() {

                  });},
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: screenWidth(10)),

        Padding(
          padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
          child: CustomText(text: tr('first_name') , textSize: screenWidth(30),),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: screenWidth(50)),
          child: Row(
            children: [
              SizedBox(width: screenWidth(20),),
              SvgPicture.asset('images/three_line.svg' , width: screenWidth(18),),
              Expanded(
                child: CustomTextField(
                  controller: controller.firstNameController,
                  hitText: tr('first_name_hint'),
                  update: (){setState(() {

                  });},
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: screenWidth(10)),

        Padding(
          padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
          child: CustomText(text: tr('last_name') , textSize: screenWidth(30),),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: screenWidth(50)),
          child: Row(
            children: [
              SizedBox(width: screenWidth(20),),
              SvgPicture.asset('images/three_line.svg' , width: screenWidth(18),),
              Expanded(
                child: CustomTextField(
                  controller: controller.lastNameController,
                  hitText: tr('last_name_hint'),
                  update: (){setState(() {

                  });},
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: screenWidth(20)),

      ],
    );
  }

  Widget FormOne(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
          child: CustomText(text: tr('enter_email') , textSize: screenWidth(30),),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: screenWidth(50)),
          child: Row(
            children: [
              SizedBox(width: screenWidth(20),),
              SvgPicture.asset('images/email.svg' , width: screenWidth(18),),
              Expanded(
                child: CustomTextField(
                  controller: controller.emailController,
                  hitText: 'email@gmail.com',
                  suffixName: 'x_circle',
                  onTap: (){controller.emailController.clear();},
                  update: (){setState(() {

                  });},
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: screenWidth(10)),

        Padding(
          padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
          child: CustomText(text: tr('enter_password') , textSize: screenWidth(30),),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: screenWidth(50)),
          child: Row(
            children: [
              SizedBox(width: screenWidth(20),),
              SvgPicture.asset('images/password.svg' , width: screenWidth(18),),
              Expanded(
                child: CustomTextField(
                  controller: controller.passwordController,
                  hitText: tr('password_hit'),
                  suffixName: controller.showPassword.value ? 'hide' : 'show',
                  hide: controller.showPassword.value,
                  onTap: (){ controller.showPassword.value =! controller.showPassword.value;},
                  update: (){setState(() {

                  });},
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: screenWidth(20)),

        Padding(
            padding: EdgeInsetsDirectional.only(start: screenWidth(18)),
            child: Row(
              children: [
                Container(
                  width: controller.passwordController.value.text.length >=
                      controller.passwordModel.value.result!.setting!.requiredLength!.toInt() ?
                  screenWidth(2) : screenWidth(2.5),
                  height: screenWidth(35),
                  decoration: BoxDecoration(
                      color: controller.passwordController.value.text.length >=
                          controller.passwordModel.value.result!.setting!
                              .requiredLength!.toInt() ?
                      AppColors.mainGreenColor : AppColors.mainYellowColor,
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(5),
                          bottomStart: Radius.circular(5)
                      )
                  ),
                ),
                Container(
                  width: controller.passwordController.value.text.length >=
                      controller.passwordModel.value.result!.setting!
                          .requiredLength!.toInt() ?
                  screenWidth(2.6) : screenWidth(2),
                  height: screenWidth(35),
                  decoration: BoxDecoration(
                      color: AppColors.PlaceholderColor,
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(5),
                          topEnd: Radius.circular(5)
                      )
                  ),
                ),
              ],
            ),
        ),

        SizedBox(height: screenWidth(30)),

        ValidateForm(
            text: tr('not_strong'),
            fontWeight: FontWeight.bold,
            svgName: controller.passwordController.value.text.length >=
                controller.passwordModel.value.result!.setting!.requiredLength!
                    .toInt() ?
            'ok' : 'warnning',
        ),

            ValidateForm(
              text: "${tr('number_of_digits_1')} ${controller.passwordModel
                  .value.result!.setting!.requiredLength
                  .toString()} ${tr('number_of_digits_2')}",
              svgName: controller.passwordController.value.text.length >=
                  controller.passwordModel.value.result!.setting!.requiredLength!.toInt() ?
              'ok' : 'wrong',
        ),

            ValidateForm(
              text: tr('upper_lower'),
              svgName: controller.passwordController.text.containsUppercase
                  ? 'ok'
                  : 'wrong',
        ),
      ],
    );
  }

}


extension StringValidators on String {
  bool get containsUppercase => contains(RegExp(r'[A-Z]'));
  bool get containsLowercase => contains(RegExp(r'[a-z]'));
}
