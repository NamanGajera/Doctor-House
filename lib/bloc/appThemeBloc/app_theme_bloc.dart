import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_event.dart';
import 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  final SharedPreferences sharedPreferences;
  bool darkTheme = false;

  AppThemeBloc({required this.sharedPreferences}) : super(AppThemeInitialState()) {
    on<ToggleThemeEvent>(_toggleThe);
    _loadTheme();
  }

  void _toggleThe(ToggleThemeEvent event, Emitter<AppThemeState> emit) {
    darkTheme = !darkTheme;
    sharedPreferences.setBool(themeKey, darkTheme);
    emit(ToggleThemeEventState(darkTheme));
  }

  Future<void> _loadTheme() async {
    darkTheme = sharedPreferences.getBool(themeKey) ?? false;
  }
}
