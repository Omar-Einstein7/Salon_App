import 'package:salon_app/domain/theme_entity.dart';

abstract class ThemeRepository {
  Future<AppThemeMode> getThemeMode();
  Future<void> setThemeMode(AppThemeMode mode);
}