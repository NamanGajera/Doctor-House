import 'package:doctor_house/features/onBoarding/bloc/on_boardin_screen_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/appThemeBloc/app_theme_bloc.dart';
import '../../features/auth/bloc/auth_bloc.dart';
import '../network/api_repository.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // External Services
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // API Service
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Repositories
  getIt.registerLazySingleton<ApiRepository>(() => ApiRepository(getIt<ApiService>()));

  // BLoCs
  getIt.registerFactory<AuthBloc>(() => AuthBloc(
        apiRepository: getIt<ApiRepository>(),
        sharedPreferences: getIt<SharedPreferences>(),
      ));

  getIt.registerFactory<AppThemeBloc>(() => AppThemeBloc(sharedPreferences: getIt<SharedPreferences>()));

  getIt.registerFactory<OnboardingBloc>(() => OnboardingBloc(apiRepository: getIt<ApiRepository>()));
}
