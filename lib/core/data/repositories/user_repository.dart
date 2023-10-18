import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/data/models/apis/signinModel.dart';
import 'package:flutter_project/core/data/models/apis/tenant_check.dart';
import 'package:flutter_project/core/data/models/common_response.dart';
import 'package:flutter_project/core/data/network/endpoints/user_endpoints.dart';
import 'package:flutter_project/core/data/network/network_config.dart';
import 'package:flutter_project/core/enums/request_type.dart';
import 'package:flutter_project/core/utils/network_util.dart';

class UserRepository {
  // Future<Either<String, SignInModel>> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     return NetworkUtil.sendRequest(
  //       type: RequestType.POST,
  //       url: UserEndpoints.register,
  //       body: {
  //         'userName': email,
  //         'password': password,
  //       },
  //       headers: NetworkConfig.getHeaders(needAuth: false),
  //     ).then((response) {
  //       CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);
  //
  //       if (commonResponse.getStatus) {
  //         return Right(SignInModel.fromJson(commonResponse.data ?? {}));
  //       } else {
  //         return Left(commonResponse.message ?? '');
  //       }
  //     });
  //   } catch (e) {
  //     return Left(e.toString());
  //   }
  // }

  Future<Either<String, SignInModel>> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String workspace,
    required String editionId,
    required String tenancyName,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.register,
        body: {
          'adminEmailAddress': email,
          'adminFirstName': firstname,
          'adminLastName': lastname,
          'adminPassword': password,
          'name': workspace,
          'tenancyName': tenancyName,
          'editionId': 1.toString(),
        },
        params: {
          'timeZone': 'asia/syria'
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(SignInModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TenantCheck>> tenantCheck({
    required String tenancyName
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.tenantCheck,
        headers: NetworkConfig.getHeaders(needAuth: false),
        body: {
          'tenancyName': tenancyName
        },
      ).then((response) {
        CommonResponse<Map<String,dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {

          return Right(TenantCheck.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}
