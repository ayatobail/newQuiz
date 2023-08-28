import 'package:dartz/dartz.dart';
import 'package:new_quiz/core/enums/request_type.dart';

import '../../utilies/network_utily.dart';
import '../models/apis/slider_model.dart';
import '../models/common_response.dart';
import '../network/endpoints/slider_endpoint.dart';
import '../network/network_config.dart';

class SliderRepository {
  Future<Either<String, sliderModel>> display() async {
    try {
      return NetworkUtil.sendRequest(
        type: requestType.GET,
        url: SliderEndpoint.slider,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(
              sliderModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}