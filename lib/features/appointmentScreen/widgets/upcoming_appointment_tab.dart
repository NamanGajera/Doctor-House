import 'package:flutter/material.dart';

import 'appointment_card_view.dart';

class UpcomingAppointmentTab extends StatefulWidget {
  const UpcomingAppointmentTab({super.key});

  @override
  State<UpcomingAppointmentTab> createState() => _UpcomingAppointmentTabState();
}

class _UpcomingAppointmentTabState extends State<UpcomingAppointmentTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) => AppointmentCardView(index: index),
    );
  }
}
