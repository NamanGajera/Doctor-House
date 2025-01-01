import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';

class DoctorStatsView extends StatelessWidget {
  const DoctorStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.isDarkTheme ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StatItem(value: '7,500+', label: 'Patients', icon: Icons.people),
            StatDivider(),
            StatItem(value: '10+', label: 'Years Exp.', icon: Icons.shopping_bag),
            StatDivider(),
            StatItem(value: '4.9', label: 'Rating', icon: Icons.star),
          ],
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue[700], size: 24),
        const SizedBox(height: 5),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}

class StatDivider extends StatelessWidget {
  const StatDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }
}
