import 'package:doctor_house/features/appointmentScreen/appointment_screen.dart';
import 'package:doctor_house/features/auth/screens/login_screen.dart';
import 'package:doctor_house/features/auth/screens/register_screen.dart';
import 'package:doctor_house/features/bookAppointmentScreen/book_appointment_screen.dart';
import 'package:doctor_house/features/bookAppointmentScreen/select_package_screen.dart';
import 'package:doctor_house/features/chatScreen/chat_screen.dart';
import 'package:doctor_house/features/doctorDetailsScreen/doctor_details_screen.dart';
import 'package:doctor_house/features/hospitalDetailsScreen/hospital_details_screen.dart';
import 'package:doctor_house/features/hospitalListScreen/hospital_list_screen.dart';
import 'package:doctor_house/features/menuScreen/menu_screen.dart';
import 'package:doctor_house/features/menuScreen/themeScreen/theme_change_screen.dart';
import 'package:doctor_house/features/pharmacyScreen/pharmacy_screen.dart';
import 'package:doctor_house/features/widgets/bottom_bar_screen.dart';
import 'package:doctor_house/features/widgets/splash_screen.dart';
import 'package:doctor_house/routers/route_names.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:go_router/go_router.dart';

import '../features/bookAppointmentScreen/patient_details_screen.dart';
import '../features/doctorListScreen/doctor_list_screen.dart';
import '../features/homeScreen/screens/home_screen.dart';
import '../features/onBoarding/screens/complete_profile_screen.dart';
import '../features/onBoarding/screens/on_boarding_screen.dart';

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

    /// Theme Change
    GoRoute(
      path: themeChangeScreenPath,
      name: themeChangeScreenName,
      builder: (context, state) {
        return const ThemeChangeScreen();
      },
    ),

    /// Home Screens
    GoRoute(
      path: doctorListScreenPath,
      name: doctorListScreenName,
      builder: (context, state) {
        return const DoctorListScreen();
      },
    ),

    GoRoute(
      path: hospitalListScreenPath,
      name: hospitalListScreenName,
      builder: (context, state) {
        return const HospitalListScreen();
      },
    ),

    GoRoute(
      path: doctorDetailsScreenPath,
      name: doctorDetailsScreenName,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        String? doctorId = extra?['doctorId'];
        return DoctorDetailsScreen(
          doctorId: doctorId ?? '',
        );
      },
    ),

    GoRoute(
      path: hospitalDetailsScreenPath,
      name: hospitalDetailScreenName,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        String? hospitalId = extra?['hospitalId'];
        return HospitalDetailsScreen(
          hospitalId: hospitalId ?? '',
        );
      },
    ),

    GoRoute(
      path: bookAppointmentScreenPath,
      name: bookAppointmentScreenName,
      builder: (context, state) {
        return const BookAppointmentScreen();
      },
    ),

    GoRoute(
      path: selectPackageScreenPath,
      name: selectPackageScreenName,
      builder: (context, state) {
        return const SelectPackageScreen();
      },
    ),

    GoRoute(
      path: patientDetailsScreenPath,
      name: patientDetailsScreenName,
      builder: (context, state) {
        return const PatientDetailsScreen();
      },
    ),

    // GoRoute(
    //   path: myBookingScreenPath,
    //   name: myBookingScreenName,
    //   builder: (context, state) {
    //     return const MyBookingScreen();
    //   },
    // ),
  ],
);
