import 'package:doctor_house/bloc/appThemeBloc/app_theme_bloc.dart';
import 'package:doctor_house/bloc/appThemeBloc/app_theme_state.dart';
import 'package:doctor_house/bloc/authScreenBloc/loginScreenBloc/login_screen_bloc.dart';
import 'package:doctor_house/bloc/authScreenBloc/registerScreenBloc/register_screen_bloc.dart';
import 'package:doctor_house/bloc/onBoardingScreenBloc/on_boardin_screen_bloc.dart';
import 'package:doctor_house/core/theme/app_theme.dart';
import 'package:doctor_house/routers/router.dart';
import 'package:doctor_house/screens/widgets/splash_screen.dart';
import 'package:doctor_house/service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

late SharedPreferences prefs;

Future<void> initSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppThemeBloc(sharedPreferences: prefs)),
        BlocProvider(create: (context)=>OnboardingBloc(sharedPreferences: prefs)),
        BlocProvider(create: (context)=>LoginScreenBloc(FirebaseAuthService())),
        BlocProvider(create: (context)=>RegisterScreenBloc(FirebaseAuthService())),
      ],
      child: BlocBuilder<AppThemeBloc,AppThemeState>(
        builder: (context,state){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: MaterialApp.router(
              title: 'Doctor House',
              debugShowCheckedModeBanner:false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              // themeMode: state is DarkThemeState ? ThemeMode.dark : ThemeMode.light,
              themeMode: ThemeMode.system,
              routerConfig: appRouter,
              // home: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
