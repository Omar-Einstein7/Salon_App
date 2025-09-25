import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:salon_app/core/constant/api_url.dart';
import 'package:salon_app/core/network/dio_clint.dart';
import 'package:salon_app/data/auth/model/signin.dart';
import 'package:salon_app/data/auth/model/signup_req_params.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../service_locator.dart';


abstract class AuthService {

   Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<Either> logout();

}


class AuthApiServiceImpl extends AuthService {

  
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {

      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap()
      );
      return Right(response.data);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> signin(SigninReqParams params) async {
     try {

      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap()
      );
      return Right(response.data);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> logout() async {
     try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('access_token');
      
      if (token == null) {
        return Left('No access token found');
      }

      var response = await sl<DioClient>().post(
        ApiUrl.logout,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          }
        ),
      );
      return Right(response.data);

    } on DioException catch(e) {
      if (e.response?.statusCode == 401) {
        return Right(true); // Token already invalid/expired, consider logout successful
      }
      return Left(e.response?.data['message'] ?? 'Logout failed');
    }
  }


  
}