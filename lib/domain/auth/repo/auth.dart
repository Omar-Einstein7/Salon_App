import 'package:dartz/dartz.dart';
import 'package:salon_app/data/auth/model/signin.dart';
import 'package:salon_app/data/auth/model/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
  Future<Either<String, bool>> logout();
}
