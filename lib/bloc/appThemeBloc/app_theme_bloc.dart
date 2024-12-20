import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';
import 'app_theme_event.dart';
import 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  final SharedPreferences sharedPreferences;

  AppThemeBloc({required this.sharedPreferences}) : super(LightThemeState()) {
    on<LightThemeEvent>((event, emit) {
      sharedPreferences.setBool(themeKey, false);
      emit(LightThemeState());
    });

    on<DarkThemeEvent>((event, emit) {
      sharedPreferences.setBool(themeKey, true);
      emit(DarkThemeState());
    });

    _loadTheme();
  }

  Future<void> _loadTheme() async {
    isDarkTheme = sharedPreferences.getBool(themeKey) ?? false;
    if (isDarkTheme) {
      add(DarkThemeEvent());
    } else {
      add(LightThemeEvent());
    }
  }
}
