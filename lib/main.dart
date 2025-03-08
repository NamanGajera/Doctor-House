import 'package:doctor_house/bloc/appThemeBloc/app_theme_bloc.dart';
import 'package:doctor_house/bloc/appThemeBloc/app_theme_state.dart';
import 'package:doctor_house/core/theme/app_theme.dart';
import 'package:doctor_house/routers/router.dart';
import 'package:doctor_house/screens/onBoardingScreen/bloc/on_boardin_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

Future<void> initSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppThemeBloc(sharedPreferences: prefs)),
          BlocProvider(create: (context) => OnboardingBloc(sharedPreferences: prefs)),
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
                // home: SplashScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
