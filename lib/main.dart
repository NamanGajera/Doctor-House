import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/appThemeBloc/app_theme_bloc.dart';
import 'bloc/appThemeBloc/app_theme_state.dart';
import 'core/di/dependency_injection.dart';
import 'core/services/shared_prefs_helper.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/onBoarding/bloc/on_boardin_screen_bloc.dart';
import 'routers/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  await setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<AppThemeBloc>()),
          BlocProvider(create: (context) => getIt<OnboardingBloc>()),
          BlocProvider(create: (context) => getIt<AuthBloc>()),
        ],
        child: BlocBuilder<AppThemeBloc, AppThemeState>(
          builder: (context, state) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
              child: MaterialApp.router(
                title: 'Doctor House',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: context.read<AppThemeBloc>().darkTheme ? ThemeMode.dark : ThemeMode.light,
                routerConfig: appRouter,
              ),
            );
          },
        ),
      ),
    );
  }
}
