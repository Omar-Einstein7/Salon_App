import 'package:salon_app/core/usecases/usecase.dart';
import 'package:salon_app/domain/auth/repo/auth.dart';

import '../../../service_locator.dart';

class IsLoggedInUseCase extends Usecase<bool,dynamic> {
  
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
  
}