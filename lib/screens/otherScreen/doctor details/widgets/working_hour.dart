import 'package:flutter/material.dart';

class WorkingHour extends StatelessWidget {
  const WorkingHour({
    super.key,
    required this.day,
    required this.workinhour,
  });

  final String day;
  final String workinhour;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Text of Day
        Text(
          day,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        const Spacer(),

        /// Text of Day
        Text(
          workinhour,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
