import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/constants/widgets.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectPackageScreen extends StatefulWidget {
  const SelectPackageScreen({super.key});

  @override
  State<SelectPackageScreen> createState() => _SelectPackageScreenState();
}

class _SelectPackageScreenState extends State<SelectPackageScreen> {
  String _selectedDuration = "30 minute";
  String _selectedPackage = "Messaging";

  final List<String> _durations = ["15 minute", "30 minute", "1 hour"];
  final List<Map<String, dynamic>> _packages = [
    {
      'icon': Icons.message_rounded,
      'title': 'Messaging',
      'price': '\$20',
      'description': 'Chat with Doctor',
      'value': 'Messaging',
      'color': Colors.blue,
    },
    {
      'icon': Icons.phone_rounded,
      'title': 'Voice Call',
      'price': '\$40',
      'description': 'Voice call with doctor',
      'value': 'Voice Call',
      'color': Colors.green,
    },
    {
      'icon': Icons.person_rounded,
      'title': 'In Person',
      'price': '\$100',
      'description': 'In Person visit with doctor',
      'value': 'In Person',
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkTheme ? Colors.black : Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Select Package',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Duration",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.isDarkTheme ? Colors.black : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: context.isDarkTheme ? Border.all(color: Colors.white60) : null,
                ),
                child: Column(
                  children: _durations.map((duration) {
                    final isSelected = _selectedDuration == duration;
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => setState(() => _selectedDuration = duration),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: _durations.last == duration
                                    ? Colors.transparent
                                    : context.isDarkTheme
                                        ? Colors.white60
                                        : Colors.grey[200]!,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                duration,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                                  color: isSelected
                                      ? primaryBlueColor
                                      : context.isDarkTheme
                                          ? Colors.white70
                                          : Colors.black87,
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: primaryBlueColor,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Select Package",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _packages.length,
                  itemBuilder: (context, index) {
                    final package = _packages[index];
                    return _buildPackageOption(
                      icon: package['icon'],
                      title: package['title'],
                      price: package['price'],
                      description: package['description'],
                      value: package['value'],
                      color: package['color'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: 'Continue',
                onPressed: () {
                  context.push(patientDetailsScreenPath);
                },
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                borderRadius: 12,
                color: primaryBlueColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPackageOption({
    required IconData icon,
    required String title,
    required String price,
    required String description,
    required String value,
    required Color color,
  }) {
    final isSelected = _selectedPackage == value;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: context.isDarkTheme ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? color
              : context.isDarkTheme
                  ? Colors.white54
                  : Colors.transparent,
          width: context.isDarkTheme ? 1 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            setState(() {
              _selectedPackage = value;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    size: 28,
                    color: color,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? color
                            : context.isDarkTheme
                                ? Colors.white30
                                : Colors.grey[200],
                        border: Border.all(
                          color: isSelected
                              ? color
                              : context.isDarkTheme
                                  ? Colors.white38
                                  : Colors.grey[300]!,
                          width: context.isDarkTheme ? 1 : 2,
                        ),
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
