import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';

class DoctorAboutView extends StatelessWidget {
  const DoctorAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.isDarkTheme ? 32 : 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Dr. Jonny Wilson is a highly experienced dentist with over 10 years of expertise in providing excellent dental care. He specializes in cosmetic dentistry, dental implants, and orthodontics. His patient-centric approach and use of advanced dental technologies ensure the best possible outcomes for his patients.',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
