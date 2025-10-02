import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/domain/get_theme_mode.dart';
import 'package:salon_app/domain/set_theme_mode.dart';
import 'package:salon_app/domain/theme_entity.dart';
import 'package:salon_app/service_locator.dart';

class ThemeCubit extends Cubit<AppThemeMode> {


  ThemeCubit() : super(AppThemeMode.light);

  Future<void> loadTheme() async {
    final mode = await sl<GetThemeMode>().call();
    emit(mode);
  }

  Future<void> changeTheme(AppThemeMode mode) async {
    await sl<SetThemeMode>()(mode);
    emit(mode);
  }
}