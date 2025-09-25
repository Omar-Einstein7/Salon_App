import 'package:dartz/dartz.dart';
import 'package:salon_app/core/usecases/usecase.dart';
import 'package:salon_app/domain/auth/repo/auth.dart';


import '../../../service_locator.dart';

class LogoutUseCase extends Usecase<Either, void> {
  
  @override
  Future<Either> call({void params}) async {
    return await sl<AuthRepository>().logout();
  }
  
}