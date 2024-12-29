abstract class AppThemeState {}

class AppThemeInitialState extends AppThemeState {}

class ToggleThemeEventState extends AppThemeState {
  final bool themeChange;

  ToggleThemeEventState(this.themeChange);
}
