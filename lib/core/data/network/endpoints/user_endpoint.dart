
import '../network_config.dart';

class UserEndpoints{
  static String login = NetworkConfig.getFullApiUrl('login');
  static String Register = NetworkConfig.getFullApiUrl('register');
  static String ForgotPassword = NetworkConfig.getFullApiUrl('user/ForgotPassword');
}