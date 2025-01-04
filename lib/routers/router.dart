import 'package:doctor_house/routers/route_names.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:doctor_house/screens/appointmentScreen/appointment_screen.dart';
import 'package:doctor_house/screens/authScreen/login_screen.dart';
import 'package:doctor_house/screens/authScreen/register_screen.dart';
import 'package:doctor_house/screens/bookAppointmentScreen/book_appointment_screen.dart';
import 'package:doctor_house/screens/bookAppointmentScreen/select_package_screen.dart';
import 'package:doctor_house/screens/chatScreen/chat_screen.dart';
import 'package:doctor_house/screens/doctorDetailsScreen/doctor_details_screen.dart';
import 'package:doctor_house/screens/hospitalDetailsScreen/hospital_details_screen.dart';
import 'package:doctor_house/screens/hospitalListScreen/hospital_list_screen.dart';
import 'package:doctor_house/screens/menuScreen/menu_screen.dart';
import 'package:doctor_house/screens/menuScreen/themeScreen/theme_change_screen.dart';
import 'package:doctor_house/screens/pharmacyScreen/pharmacy_screen.dart';
import 'package:doctor_house/screens/widgets/bottom_bar_screen.dart';
import 'package:doctor_house/screens/widgets/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/bookAppointmentScreen/patient_details_screen.dart';
import '../screens/completeProfileScreen/complete_profile_screen.dart';
import '../screens/doctorListScreen/doctor_list_screen.dart';
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
        return const DoctorDetailsScreen();
      },
    ),

    GoRoute(
      path: hospitalDetailsScreenPath,
      name: hospitalDetailScreenName,
      builder: (context, state) {
        return const HospitalDetailsScreen();
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
