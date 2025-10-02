import 'package:salon_app/data/local_theme_datasource.dart';
import 'package:salon_app/domain/theme_entity.dart';
import 'package:salon_app/domain/theme_repository.dart';
import 'package:salon_app/service_locator.dart';

class ThemeRepositoryImpl implements ThemeRepository {


  @override
  Future<AppThemeMode> getThemeMode() async {
    return await sl<LocalThemeDataSource>().getThemeMode();
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) async {
    await sl<LocalThemeDataSource>().setThemeMode(mode);
  }
}