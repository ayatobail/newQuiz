
import '../network_config.dart';

class UserEndpoints{
  static String login = NetworkConfig.getFullApiUrl('api/login');
  static String Register = NetworkConfig.getFullApiUrl('register');
  static String ForgotPassword = NetworkConfig.getFullApiUrl('user/ForgotPassword');
}