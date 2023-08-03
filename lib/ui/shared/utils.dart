import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ui/shared/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


double screenWidth(double percent) {
  return Get.size.width / percent ;
}

double screenHeight(double percent) {
  return Get.size.height / percent ;
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
  return Container(
    width: screenWidth(5),
    height: screenWidth(5),
    decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15)),
    child: SpinKitCircle(color: AppColors.mainOrangeColor),
  );
});
