import 'package:doctor_house/routers/route_names.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:doctor_house/screens/appointmentScreen/appointment_screen.dart';
import 'package:doctor_house/screens/authScreen/login_screen.dart';
import 'package:doctor_house/screens/authScreen/register_screen.dart';
import 'package:doctor_house/screens/chatScreen/chat_screen.dart';
import 'package:doctor_house/screens/menuScreen/menu_screen.dart';
import 'package:doctor_house/screens/pharmacyScreen/pharmacy_screen.dart';
import 'package:doctor_house/screens/widgets/bottom_bar_screen.dart';
import 'package:doctor_house/screens/widgets/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/completeProfileScreen/complete_profile_screen.dart';
import '../screens/homeScreen/home_screen.dart';
import '../screens/onBoardingScreen/on_boarding_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: splashScreenPath,
  routes: [
    GoRoute(
        path: splashScreenPath,
        name: splashScreenName,
        builder: (context, state) {
          return const SplashScreen();
        }),
    GoRoute(
        path: registerScreenPath,
        name: registerScreenName,
        builder: (context, state) {
          return const RegisterScreen();
        }),
    GoRoute(
        path: loginScreenPath,
        name: loginScreenName,
        builder: (context, state) {
          return const LoginScreen();
        }),
    GoRoute(
        path: onBoardingScreenPath,
        name: onBoardingScreenName,
        builder: (context, state) {
          return const OnBoardingScreen();
        }),
    GoRoute(
        path: completeProfileScreenPath,
        name: completeProfileScreenPath,
        builder: (context, state) {
          return const CompleteProfileScreen();
        }),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomBarScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: homeScreenPath,
              name: homeScreenName,
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: appointmentScreenPath,
              name: appointmentScreenName,
              builder: (context, state) => const AppointmentScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: chatScreenPath,
              name: chatScreenName,
              builder: (context, state) => const ChatScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pharmacyScreenPath,
              name: pharmacyScreenName,
              builder: (context, state) => const PharmacyScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: menuScreenPath,
              name: menuScreenName,
              builder: (context, state) => const MenuScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
