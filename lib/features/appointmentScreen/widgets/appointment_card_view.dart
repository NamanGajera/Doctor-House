import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';

class AppointmentCardView extends StatefulWidget {
  final int index;

  const AppointmentCardView({super.key, required this.index});

  @override
  State<AppointmentCardView> createState() => _AppointmentCardViewState();
}

class _AppointmentCardViewState extends State<AppointmentCardView> {
  // State variable for the switch
  bool _isRemindMeOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: context.isDarkTheme ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: context.isDarkTheme ? Border.all(color: Colors.white38) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildAppointmentHeader(),
          const Divider(height: 5),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildDoctorInfo(),
                const SizedBox(height: 16),
                _buildAppointmentDetails(),
                const SizedBox(height: 16),
                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 8),
              Text(
                'Aug 25, 2023 - 10:00 AM',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Remind me',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 10),
              ),
              SizedBox(
                height: 20,
                width: 40,
                child: Transform.scale(
                  scale: 0.6, // Adjust this value to reduce the size
                  child: Switch(
                    value: _isRemindMeOn,
                    activeTrackColor: primaryBlueColor,
                    onChanged: (value) {
                      setState(() {
                        _isRemindMeOn = value;
                      });
                    },
                    activeColor: Colors.white,
                    inactiveTrackColor: context.isDarkTheme ? Colors.white10 : Colors.grey.shade200,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 65,
          width: 65,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: context.isDarkTheme ? Colors.white54 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image.asset(doctorSampleImage),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 2),
              Text(
                'Dr. Jenny William',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Cardiologist',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  _buildInfoTag(Icons.star, '4.8', Colors.amber.shade700),
                  const SizedBox(width: 8),
                  _buildInfoTag(Icons.work_outline, '15+ years', Colors.blue),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTag(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.isDarkTheme ? color.withOpacity(0.25) : color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentDetails() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildDetailRow(Icons.confirmation_number_outlined, '#DR452SA54'),
          const SizedBox(height: 8),
          _buildDetailRow(Icons.location_on_outlined, 'G8502 Preston Rd. Inglewood'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.blue[700]),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.close, size: 18),
            label: const Text('Cancel'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit_calendar, size: 18),
            label: const Text('Reschedule'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
