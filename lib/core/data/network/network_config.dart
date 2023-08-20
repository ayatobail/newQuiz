
import '../../../UI/shared/utilis.dart';

import '../../enums/request_type.dart';
import '../../utilies/general_utilies.dart';
//مركزية لبعض الأمور الي رح تطلع بكل ريكويست عنا
class NetworkConfig {
  static String BASE_API = 'api/';



  static String getFullApiUrl(String api)  {return api; }


//كلشي هيديرز لازميني بحطهم بالnetworkconfig.getheaders

  //في شغلات متشابهة بالهيدر لكل الريكويست
  static Map<String, String> getHeaders(
      {bool? needAuth = true, //الاشمل بدهم autharization
        requestType? type = requestType.POST,
        Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth!)//عاطي قيمة افتراضية مستحيل تكون null
        'Authorization':
        'Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type == requestType.POST) 'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}