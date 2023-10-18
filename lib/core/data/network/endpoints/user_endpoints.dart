import 'package:flutter_project/core/data/network/network_config.dart';

class UserEndpoints
{
  static String login=NetworkConfig.getFullApiUrl('user/login');
  static String register = NetworkConfig.getFullApiUrl('TenantRegistration/RegisterTenant');
  static String tenantCheck = NetworkConfig.getFullApiUrl('Account/IsTenantAvailable');
}