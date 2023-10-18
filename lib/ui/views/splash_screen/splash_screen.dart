import 'package:flutter/material.dart';
import 'package:flutter_project/core/translations/app_translations.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:flutter_project/ui/views/landing_view/landing_view.dart';
import 'package:flutter_project/ui/views/signin_view/signin_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => controller.passwordModel.value.result!.setting!.requiredLength == null ?
        CustomToast.showMessage(message: 'please check your internet connection') : Get.off(LandingView()));
    super.initState();
  }

  SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset('images/workiom_logo.svg' , width: screenWidth(5),)),
              SizedBox(height: screenWidth(20)),
              CustomText(text: tr('splash_logo') , textSize: screenWidth(15) , fontWeight: FontWeight.bold,),
            ],
          ),
        ),
    );
  }
}
