import 'package:flutter_project/app/my_app_controller.dart';
import 'package:flutter_project/core/data/repositories/shared_preferences_repositories.dart';
import 'package:flutter_project/core/enums/connectivityStatus.dart';
import 'package:flutter_project/core/enums/message_type.dart';
import 'package:flutter_project/core/services/connectivity_service.dart';
import 'package:flutter_project/core/services/location_service.dart';
import 'package:flutter_project/core/services/notification_service.dart';
import 'package:flutter_project/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

SharedPreferencesRepositories get storage => Get.find<SharedPreferencesRepositories>();

// CartService get cartService => Get.find<CartService>();

LocationService get locationService => Get.find<LocationService>();

NotificationService get notificationService => Get.find<NotificationService>();

// void fadeInTransition(Widget view) {
//   Get.to(view, transition: Transition.fadeIn);
// }

// double get taxAmount => 0.18;
// double get deliveryAmount => 0.1;

bool get isOnline => Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    CustomToast.showMessage(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}

// void checkConnection(Function function) async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult != ConnectivityResult.none) {
//     function();
//   } else {
//     CustomToast.showMessage(
//       message: 'Please check internet connection',
//       messageType: MessageType.WARNING,
//     );
//   }
// }