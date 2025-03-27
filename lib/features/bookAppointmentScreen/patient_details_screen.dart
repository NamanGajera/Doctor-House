import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/widgets.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});

  @override
  _PatientDetailsScreenState createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? bookingFor, gender, name, age, problem, contactNumber, preferredTime;
  bool isOther = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkTheme ? Colors.black : Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: context.isDarkTheme ? Colors.black : Colors.grey.shade50,
        surfaceTintColor: context.isDarkTheme ? Colors.black : Colors.grey.shade50,
        title: Text(
          'Patient Details',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              children: [
                _buildSection(
                  'Personal Details',
                  Icons.person_outline,
                  [
                    _buildAnimatedDropdown(
                      'Booking For',
                      bookingFor,
                      ['Self', 'Other'],
                      (value) {
                        setState(() {
                          bookingFor = value;
                          isOther = value == 'Other';
                        });
                      },
                    ),
                    if (isOther) ...[
                      const SizedBox(height: 16),
                      _buildAnimatedTextField(
                        'Patient Name',
                        Icons.person,
                        onChanged: (value) => name = value,
                      ),
                    ],
                    const SizedBox(height: 16),
                    _buildAnimatedDropdown(
                      'Gender',
                      gender,
                      ['Male', 'Female', 'Other'],
                      (value) => setState(() => gender = value),
                    ),
                    const SizedBox(height: 16),
                    _buildAnimatedTextField(
                      'Age',
                      Icons.calendar_today,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => age = value,
                    ),
                  ],
                ),
                _buildSection(
                  'Contact Details',
                  Icons.contact_phone,
                  [
                    _buildAnimatedTextField(
                      'Contact Number',
                      Icons.phone,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => contactNumber = value,
                    ),
                  ],
                ),
                _buildSection(
                  'Medical Information',
                  Icons.medical_information,
                  [
                    _buildAnimatedTextField(
                      'Describe Your Problem',
                      Icons.description,
                      maxLines: 4,
                      onChanged: (value) => problem = value,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: 'Next',
                  onPressed: () {
                    // context.push(patientDetailsScreenPath);
                  },
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  borderRadius: 12,
                  color: primaryBlueColor,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryBlueColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: primaryBlueColor),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 17),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: context.isDarkTheme ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: context.isDarkTheme ? Border.all(color: Colors.white54) : null,
              boxShadow: context.isDarkTheme
                  ? null
                  : [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedTextField(
    String label,
    IconData icon, {
    int maxLines = 1,
    TextInputType? keyboardType,
    required ValueChanged<String> onChanged,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: primaryBlueColor.withOpacity(0.7),
          size: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: context.isDarkTheme ? Colors.white10 : Colors.grey.shade50,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: (value) => value!.isEmpty ? 'This field is required' : null,
    );
  }

  Widget _buildAnimatedDropdown(
    String label,
    String? value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.labelSmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: context.isDarkTheme ? Colors.white10 : Colors.grey.shade50,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
      value: items.contains(value) ? value : null,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? 'Please select $label' : null,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      isExpanded: true,
      borderRadius: BorderRadius.circular(10),
      dropdownColor: context.isDarkTheme ? Colors.black : Colors.white,
    );
  }

  Widget _buildTimeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Preferred Time',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildTimeChip('Morning', Icons.wb_sunny_outlined),
            const SizedBox(width: 12),
            _buildTimeChip('Afternoon', Icons.wb_sunny),
            const SizedBox(width: 12),
            _buildTimeChip('Evening', Icons.nights_stay_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeChip(String time, IconData icon) {
    final isSelected = preferredTime == time;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => preferredTime = time),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey.shade600,
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Processing Appointment'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }
  }
}
