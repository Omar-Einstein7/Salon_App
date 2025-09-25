import 'package:dartz/dartz.dart';
import 'package:salon_app/core/usecases/usecase.dart';
import 'package:salon_app/data/auth/model/signup_req_params.dart';
import 'package:salon_app/domain/auth/repo/auth.dart';
import 'package:salon_app/service_locator.dart';


class SignupUseCase extends Usecase<Either,SignupReqParams> {
  
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
  
}