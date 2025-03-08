import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';

class DoctorWorkingHours extends StatelessWidget {
  const DoctorWorkingHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            const WorkingHoursList(),
          ],
        ),
      ),
    );
  }
}

class WorkingHoursList extends StatelessWidget {
  const WorkingHoursList({super.key});

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
        final bool isClosed = day == 'Sunday';
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
                isClosed ? 'Closed' : '09:00 AM - 06:00 PM',
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
