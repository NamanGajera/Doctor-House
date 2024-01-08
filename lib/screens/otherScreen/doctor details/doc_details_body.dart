import 'package:flutter/material.dart';

import '../../home/homeScreen/widgets/heading.dart';
import 'widgets/doctor_details_text.dart';
import 'widgets/working_hour.dart';

class DocDetailsBody extends StatelessWidget {
  const DocDetailsBody({
    super.key,
    required this.docdescription,
  });
  final String docdescription;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Doctor Description
        DoctorDetailsText(docdescription: docdescription),
        const SizedBox(height: 10),

        /// Working Hours
        Heading(
          heading: 'Working Hours',
          wantseebtn: false,
          headingFontSize: 20,
        ),
        const Divider(thickness: 1.1),
        const SizedBox(height: 8),
        const WorkingHour(
          day: 'Monday',
          workinhour: '00:00 - 00:00',
        ),
        const SizedBox(height: 5),
        const WorkingHour(
          day: 'Tuesday',
          workinhour: '00:00 - 00:00',
        ),
        const SizedBox(height: 5),
        const WorkingHour(
          day: 'Wednesday',
          workinhour: '00:00 - 00:00',
        ),
        const SizedBox(height: 5),
        const WorkingHour(
          day: 'Thursday',
          workinhour: '00:00 - 00:00',
        ),
        const SizedBox(height: 5),
        const WorkingHour(
          day: 'Friday',
          workinhour: '00:00 - 00:00',
        ),
        const SizedBox(height: 5),
        const WorkingHour(
          day: 'Saturday',
          workinhour: '00:00 - 00:00',
        ),
        const SizedBox(height: 5),
        const WorkingHour(
          day: 'Sunday',
          workinhour: '00:00 - 00:00',
        ),
      ],
    );
  }
}
