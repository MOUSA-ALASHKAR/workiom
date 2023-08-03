import 'package:flutter_project/core/enums/connectivityStatus.dart';
import 'package:flutter_project/core/services/base_controller.dart';
import 'package:flutter_project/core/utils/general_util.dart';

class MyAppController extends BaseController {

  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;

  @override
  void onInit() {
    listenToConnectionStatus();
    super.onInit();
  }

  void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      connectionStatus = event;
    });
  }
}