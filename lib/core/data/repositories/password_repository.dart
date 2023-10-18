import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/data/models/apis/password_model.dart';
import 'package:flutter_project/core/data/models/common_response.dart';
import 'package:flutter_project/core/data/network/endpoints/password_endpoint.dart';
import 'package:flutter_project/core/data/network/network_config.dart';
import 'package:flutter_project/core/enums/request_type.dart';
import 'package:flutter_project/core/utils/network_util.dart';

class PasswordRepository {
  Future<Either<String, PasswordModel>> checkPassword() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: PasswordEndpoints.checkPassword,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String,dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {

          return Right(PasswordModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}