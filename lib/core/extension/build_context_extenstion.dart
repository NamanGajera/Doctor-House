import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/appThemeBloc/app_theme_bloc.dart';

extension BuildContextExtensions on BuildContext {
  // Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  // Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  // Get the theme
  bool get isDarkTheme => read<AppThemeBloc>().darkTheme;
}
