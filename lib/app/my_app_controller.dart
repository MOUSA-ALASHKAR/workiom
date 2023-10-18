import 'package:flutter_project/core/enums/connectivityStatus.dart';
import 'package:flutter_project/core/services/base_controller.dart';

class MyAppController extends BaseController {

  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;

  // @override
  // void onInit() {
  //   listenToConnectionStatus();
  //   super.onInit();
  // }

  // void listenToConnectionStatus() {
  //   connectivityService.connectivityStatusController.stream.listen((event) {
  //     connectionStatus = event;
  //   });
  // }
}