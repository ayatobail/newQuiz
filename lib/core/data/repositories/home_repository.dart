import 'package:dartz/dartz.dart';
import 'package:new_quiz/core/data/models/apis/allSpecializationModel.dart';
import 'package:new_quiz/core/data/network/endpoints/home_endpoint.dart';
import 'package:new_quiz/core/enums/request_type.dart';

import '../../utilies/network_utily.dart';
import '../models/common_response.dart';

import '../network/network_config.dart';

class HomeRepository {
  Future<Either<String, allSpecializationModel>> display() async {
    try {
      return NetworkUtil.sendRequest(
        type: requestType.GET,
        url: HomeEndpoints.allSpecializations,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(
              allSpecializationModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}