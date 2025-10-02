import 'package:salon_app/domain/theme_entity.dart';
import 'package:salon_app/domain/theme_repository.dart';
import 'package:salon_app/service_locator.dart';

class SetThemeMode {


  Future<void> call(AppThemeMode mode) async {
    await sl<ThemeRepository>().setThemeMode(mode);
  }
}
