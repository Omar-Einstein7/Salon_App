import 'package:salon_app/domain/theme_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalThemeDataSource {
  Future<AppThemeMode> getThemeMode();
  Future<void> setThemeMode(AppThemeMode mode);
}

class LocalThemeDataSourceImpl implements LocalThemeDataSource {
  static const _themeKey = "theme_mode";

  @override
  Future<AppThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_themeKey) ?? "light";
    return value == "dark" ? AppThemeMode.dark : AppThemeMode.light;
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
  }
}