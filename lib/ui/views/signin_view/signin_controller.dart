import 'package:flutter/material.dart';
import 'package:flutter_project/core/data/models/apis/password_model.dart';
import 'package:flutter_project/core/data/models/apis/tenant_check.dart';
import 'package:flutter_project/core/data/repositories/password_repository.dart';
import 'package:flutter_project/core/data/repositories/user_repository.dart';
import 'package:flutter_project/core/enums/message_type.dart';
import 'package:flutter_project/core/services/base_controller.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_project/ui/views/end_view/end_view.dart';
import 'package:flutter_project/ui/views/signin_view/signin_view.dart';
import 'package:get/get.dart';

class SignInController extends BaseController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Rx<PasswordModel> passwordModel = PasswordModel().obs;
  Rx<TenantCheck> tenantCheck = TenantCheck().obs;

  RxInt pageIndex = 1.obs;
  RxBool showPassword = false.obs;

  @override
  void onInit() {
    getPasswordConditions();
    super.onInit();
  }

  bool isEmpty() => companyController.text.length > 2 &&
    firstNameController.text.length > 2 &&
    lastNameController.text.length > 2;

  bool checkPassword() => passwordController.text.length >= passwordModel.value.result!.setting!.requiredLength!.toInt() &&
        emailController.text.length >= 8 &&
        passwordController.text.containsUppercase;


  void checkTenant(){
    runLoadingFutureFunction(
        function: UserRepository().tenantCheck(
            tenancyName: companyController.text
        ).then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: 'The Company name already exist' , messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(message: 'The Company name already exist' , messageType: MessageType.SUCCESS);
            register();
          });
        })
    );
  }

  void register() {
    runFullLoadingFutureFunction(
        function: UserRepository().register(
            email: emailController.text,
            password: passwordController.text,
            firstname: firstNameController.text,
            lastname: lastNameController.text,
            workspace: companyController.text,
            editionId: '1',
            tenancyName: companyController.text
        ).then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: "company name already taken", messageType: MessageType.REJECTED);
          }, (r) {
            Get.to(EndView());
            CustomToast.showMessage(message: "sign in done successfully", messageType: MessageType.SUCCESS);
          });
        }));
  }

  void getPasswordConditions(){
    PasswordRepository().checkPassword().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l , messageType: MessageType.REJECTED);
      }, (r) {
        passwordModel.value = r;
      });
    });
  }

  void nextPage(){
     pageIndex < 3 ? pageIndex = pageIndex + 1 : pageIndex ;
  }

  void lastPage(){
    pageIndex > 0 ? pageIndex = pageIndex - 1 : pageIndex;
  }

}