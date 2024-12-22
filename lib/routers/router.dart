import 'package:doctor_house/routers/route_names.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:doctor_house/screens/appointmentScreen/appointment_screen.dart';
import 'package:doctor_house/screens/menuScreen/menu_screen.dart';
import 'package:doctor_house/screens/pharmacyScreen/pharmacy_screen.dart';
import 'package:doctor_house/screens/socialScreen/social_screen.dart';
import 'package:doctor_house/screens/widgets/bottom_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/homeScreen/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: splashScreenPath,
  routes: [
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
                return HomeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: appointmentScreenPath,
              name: appointmentScreenName,
              builder: (context, state) => AppointmentScreen(

              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: socialScreenPath,
              name: socialScreenName,
              builder: (context, state) => SocialScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pharmacyScreenPath,
              name: pharmacyScreenName,
              builder: (context, state) => PharmacyScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: menuScreenPath,
              name: menuScreenName,
              builder: (context, state) => MenuScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
