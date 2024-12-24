import 'package:doctor_house/bloc/appThemeBloc/app_theme_bloc.dart';
import 'package:doctor_house/bloc/appThemeBloc/app_theme_state.dart';
import 'package:doctor_house/screens/authScreen/bloc/registerScreenBloc/register_screen_bloc.dart';
import 'package:doctor_house/screens/authScreen/services/supabase_auth_service.dart';
import 'package:doctor_house/screens/completeProfileScreen/bloc/complete_profile_screen_bloc.dart';
import 'package:doctor_house/screens/completeProfileScreen/repository/user_profile_repository.dart';
import 'package:doctor_house/screens/onBoardingScreen/bloc/on_boardin_screen_bloc.dart';
import 'package:doctor_house/core/theme/app_theme.dart';
import 'package:doctor_house/routers/router.dart';
import 'package:doctor_house/screens/widgets/splash_screen.dart';
import 'package:doctor_house/screens/authScreen/services/firebase_auth_service.dart';
import 'package:doctor_house/secrets/app_secrets.dart';
import 'package:doctor_house/service/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';
import 'screens/authScreen/bloc/loginScreenBloc/login_screen_bloc.dart';

late SharedPreferences prefs;

Future<void> initSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await Supabase.initialize(
    url: supaBaseProjectUrl,
    anonKey: supaBaseAnonKey,
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
        BlocProvider(create: (context)=>LoginScreenBloc(SupabaseAuthService())),
        BlocProvider(create: (context)=>RegisterScreenBloc(SupabaseAuthService())),
        BlocProvider(create: (context)=>CompleteProfileScreenBloc(UserProfileRepository(FirebaseService()))),
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
              themeMode: ThemeMode.light,
              routerConfig: appRouter,
              // home: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
