import 'package:dartz/dartz.dart';
import 'package:salon_app/core/usecases/usecase.dart';
import 'package:salon_app/data/auth/model/signin.dart';
import 'package:salon_app/domain/auth/repo/auth.dart';

import '../../../service_locator.dart';

class SigninUseCase extends Usecase<Either,SigninReqParams> {
  
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
  
}