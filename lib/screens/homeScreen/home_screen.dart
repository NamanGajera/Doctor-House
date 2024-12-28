import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/constants/images.dart';
import 'package:doctor_house/core/constants/widgets.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/screens/homeScreen/widgets/doctor_category_list_view.dart';
import 'package:doctor_house/screens/homeScreen/widgets/top_specialists_view.dart';
import 'package:doctor_house/screens/homeScreen/widgets/trusted_hospitals_view.dart';
import 'package:doctor_house/screens/homeScreen/widgets/upcoming_schedule_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// User Name, Search and Notification Button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey $userName!',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        'Explore doctors by specialty and book your next visit now.',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                const Row(
                  children: [
                    CustomIconContainer(
                      iconPath: searchIcon,
                    ),
                    SizedBox(width: 10),
                    CustomIconContainer(
                      iconPath: notificationIcon,
                    ),
                  ],
                ).withPadding(const EdgeInsets.only(top: 3)),
                const SizedBox(width: 5),
              ],
            ),
            const SizedBox(height: 8),

            /// Doctors Category List
            const DoctorCategoryListView(),
            const SizedBox(height: 8),

            /// Upcoming Schedule Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Upcoming Schedule',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: primaryDarkBlueColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ).centered(),
                    ),
                  ],
                ),
                const Text(
                  'See All',
                  style: TextStyle(
                    color: primaryBlueColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            /// Upcoming Schedule View
            const UpcomingScheduleView(),
            const SizedBox(height: 12),

            /// Top Specialists Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Specialists',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Text(
                  'See All',
                  style: TextStyle(
                    color: primaryBlueColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            /// Top Specialist View
            const TopSpecialistsView(),
            const SizedBox(height: 10),

            /// Trusted Hospitals Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trusted Hospitals',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Text(
                  'See All',
                  style: TextStyle(
                    color: primaryBlueColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            /// Trusted Hospitals View
            const TrustedHospitalsView(),
            const SizedBox(height: 10)
          ],
        ).withPadding(const EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
      ),
    );
  }
}
