class CommonResponse<T> {
  T? data;
  int? statusCode;
  String? message;//رسائل الخطأ

  CommonResponse.fromJson(Map<String, dynamic> json) {//ببني كلاس من جسون
    try {
      this.statusCode = json['statusCode'];
      if (statusCode == 200) {
        this.data = json['response'];
      } else {
        if (json['response'] != null &&
            json['response'] is Map && //formated json  بقابلها  map
            json['response']['message'] != null) {
          this.message = json['response']['title'];
        } else {
          switch (statusCode) {
            case 400:
              message = '400 Bad request';
              break;
            case 401:
              message = '401 Unauthorized';
              break;
            case 500:
              message = '500 Internal server error';
              break;
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  bool get getStatus => statusCode == 200 ? true : false;


}