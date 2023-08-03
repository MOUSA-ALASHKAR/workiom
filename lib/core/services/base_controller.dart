import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_project/core/enums/Operation_type.dart';
import 'package:flutter_project/core/enums/request_status.dart';
import 'package:flutter_project/core/utils/general_util.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {

  // UserRepository userRepository = Get.put(UserRepository());

  Rx<RequestStatus> requestStatus = RequestStatus.DEFAULT.obs;
  Rx<OperationType> operationType = OperationType.NONE.obs;

  RxList<OperationType> listType = <OperationType>[].obs;

  Future runFutureFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutureFunction(
      {required Future function,
        OperationType? type = OperationType.NONE}) async {
    checkConnection(() async {
      requestStatus.value = RequestStatus.LOADING;
      operationType.value = type!;
      listType.add(type);
      await function;
      requestStatus.value = RequestStatus.DEFAULT;
      operationType.value = OperationType.NONE;
    });
  }

  Future runFullLoadingFutureFunction({
    required Future function,
  }) async {
    checkConnection(() async {
      customLoader();
      await function;
      BotToast.closeAllLoading();
    });
  }
}