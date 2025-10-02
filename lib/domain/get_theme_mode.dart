
import 'package:salon_app/domain/theme_entity.dart';
import 'package:salon_app/domain/theme_repository.dart';
import 'package:salon_app/service_locator.dart';

class GetThemeMode {


  Future<AppThemeMode> call() async {
    return await sl<ThemeRepository>().getThemeMode();
  }
}