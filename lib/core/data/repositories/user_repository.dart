import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:new_quiz/core/data/models/apis/login_model.dart';
import 'package:new_quiz/core/enums/request_type.dart';

import '../../utilies/network_utily.dart';
import '../models/apis/token_info.dart';
import '../models/common_response.dart';
import '../network/endpoints/user_endpoint.dart';
import '../network/network_config.dart';

class UserRepository {
  Future<Either<String, loginModel>> login({//ازا صح بترجع موديل وازا لا بترجع string
    required String email,
    required String code,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: requestType.POST,
        url: UserEndpoints.login,
        body: {
          'name': email,
          'login_code': code,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(loginModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String, bool>> LogIn({
    required String userName,
    required String code,
    r
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: requestType.POST,
        url: UserEndpoints.login,
        fields: {
          'name': userName,
          'login_code': code,
        },

        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }



  Future<Either<String, bool>> register({
    required String userName,
    required String code,
    required String specialization
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: requestType.POST,
        url: UserEndpoints.Register,
        fields: {
          'name': userName,
          'mobile_phone': code,
          'specialization_id': specialization
        },

        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}