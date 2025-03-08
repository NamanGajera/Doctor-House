import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/widgets.dart';
import '../doctorDetailsScreen/widgets/doctor_profile_view.dart';
import '../doctorDetailsScreen/widgets/doctor_stats_view.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime? selectedDate;
  String? selectedTime;
  List<DateTime> availableDates = [];
  List<String> availableTimeSlots = [];

  @override
  void initState() {
    initializeDates();
    super.initState();
  }

  bool isDateValid(DateTime date) {
    if (date.day != DateTime.now().day) return true;
    DateTime now = DateTime.now();
    for (int hour = 7; hour <= 19; hour++) {
      if (hour == 12) continue;
      for (int minute = 0; minute < 60; minute += 30) {
        DateTime timeSlot = DateTime(date.year, date.month, date.day, hour, minute);
        if (timeSlot.isAfter(now)) return true;
      }
    }
    return false;
  }

  void initializeDates() {
    DateTime now = DateTime.now();
    List<DateTime> nextSevenDays = List.generate(7, (index) => DateTime(now.year, now.month, now.day).add(Duration(days: index)));
    availableDates = nextSevenDays.where((date) => isDateValid(date)).toList();
    selectedDate = availableDates.first;
    generateTimeSlots();
  }

  void generateTimeSlots() {
    availableTimeSlots.clear();
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day);
    bool isToday = currentDate.year == now.year && currentDate.month == now.month && currentDate.day == now.day;

    for (int hour = 7; hour <= 19; hour++) {
      if (hour == 12) continue;
      for (int minute = 0; minute < 60; minute += 30) {
        DateTime timeSlot = DateTime(currentDate.year, currentDate.month, currentDate.day, hour, minute);
        if (isToday && timeSlot.isBefore(now)) continue;
        availableTimeSlots.add(DateFormat('h:mm a').format(timeSlot));
      }
    }

    if (availableTimeSlots.isNotEmpty && selectedTime == null) {
      selectedTime = availableTimeSlots.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Appointment',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const DoctorProfileView(),
          const SizedBox(height: 16),
          const DoctorStatsView(),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 87,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: availableDates.length,
                    itemBuilder: (context, index) {
                      final date = availableDates[index];
                      final isSelected = selectedDate?.day == date.day;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12, bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date;
                              selectedTime = null;
                              generateTimeSlots();
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 100,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue
                                  : context.isDarkTheme
                                      ? Colors.black
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: (context.isDarkTheme && !isSelected) ? Border.all(color: Colors.white60) : null,
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.4),
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      )
                                    ]
                                  : [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 3,
                                        offset: const Offset(0, 2),
                                      )
                                    ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  date.day == DateTime.now().day ? 'Today' : DateFormat('EEE').format(date),
                                  style: TextStyle(
                                    color: (isSelected || context.isDarkTheme) ? Colors.white : Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  DateFormat('d MMM').format(date),
                                  style: TextStyle(
                                    color: (isSelected || context.isDarkTheme) ? Colors.white : Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Time',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: availableTimeSlots.map((time) {
                    final isSelected = selectedTime == time;
                    return GestureDetector(
                      onTap: () => setState(() => selectedTime = time),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue
                              : context.isDarkTheme
                                  ? Colors.black
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: (context.isDarkTheme && !isSelected) ? Border.all(color: Colors.white60) : null,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  )
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  )
                                ],
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: (isSelected || context.isDarkTheme) ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            label: 'Book Appointment',
            textColor: Colors.white,
            onPressed: () {
              context.push(selectPackageScreenPath);
            },
            width: double.infinity,
            color: primaryBlueColor,
            borderRadius: 12,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
