import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/features/homeScreen/bloc/home_screen_bloc.dart';
import 'package:doctor_house/utils/date_formatter.dart';
import 'package:doctor_house/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../commonModel/doctor_details_data_model.dart';

class DoctorWorkingHours extends StatelessWidget {
  const DoctorWorkingHours({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return state.showDoctorDataFetchLoader
            ? shimmer()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: context.isDarkTheme ? Colors.blue.withOpacity(0.2) : Colors.blue.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.blue[700]),
                          const SizedBox(width: 8),
                          Text(
                            'Working Hours',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      WorkingHoursList(
                        state: state,
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Widget shimmer() {
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade300,
      baseColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 25,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: List.generate(7, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ).withPadding(const EdgeInsets.symmetric(horizontal: 16)),
    );
  }
}

class WorkingHoursList extends StatelessWidget {
  final HomeScreenState state;

  const WorkingHoursList({super.key, required this.state});

  String _formatTime(String time) {
    // Convert 24-hour format to 12-hour format
    final hour = int.parse(time.split(':')[0]);
    final minute = time.split(':')[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    final formattedHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$formattedHour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return Column(
      children: days.map((day) {
        WorkingHours? workingHour = state.doctorData?.workingHours?.firstWhere(
          (hour) => hour.day == day,
          orElse: () => WorkingHours(),
        );

        // Determine if the day is closed
        final bool isClosed = workingHour == null || !(workingHour.isAvailable ?? false);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                day,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                isClosed
                    ? 'Closed'
                    : (workingHour.startTime != null)
                        ? '${DateTimeFormatter.convertTime('${workingHour.startTime}', from: DateFormatType.timeToTwelveHour, to: DateFormatType.twelveHourTime)} - ${DateTimeFormatter.convertTime('${workingHour.endTime}', from: DateFormatType.timeToTwelveHour, to: DateFormatType.twelveHourTime)}'
                        : '-',
                style: TextStyle(
                  fontSize: 14,
                  color: isClosed ? Colors.red : Colors.grey[700],
                  fontWeight: isClosed ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
