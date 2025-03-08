import 'dart:io';

import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              'Update Profile Picture',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImagePickerOption(
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                _buildImagePickerOption(
                  icon: Icons.photo_library,
                  label: 'Gallery',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePickerOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32, color: Colors.blue.shade700),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff0e75f9),
            Color(0xff004cdb),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade900.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _showImagePickerBottomSheet,
            child: Stack(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff4fa4ff),
                        Color(0xff0165fc),
                      ],
                    ),
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: _imageFile != null
                        ? Image.file(_imageFile!, fit: BoxFit.cover)
                        : Container(
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'john.doe@email.com',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String title, List<MenuTileData> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  fontSize: 14,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: context.isDarkTheme ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: items.map((item) => _buildMenuTile(item)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTile(MenuTileData item) {
    return ListTile(
      contentPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 8),
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: item.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(item.icon, color: item.color),
      ),
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      subtitle: Text(
        item.subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 13,
            ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
      onTap: item.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildProfileCard(),
            _buildCategorySection(
              'PERSONAL INFORMATION',
              [
                MenuTileData(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  subtitle: 'Update your personal details',
                  color: Colors.blue,
                  onTap: () {},
                ),
                MenuTileData(
                  icon: Icons.medical_information_outlined,
                  title: 'Health Profile',
                  subtitle: 'Medical conditions, allergies & more',
                  color: Colors.green,
                  onTap: () {},
                ),
                MenuTileData(
                  icon: Icons.family_restroom,
                  title: 'Family Members',
                  subtitle: 'Manage family profiles',
                  color: Colors.purple,
                  onTap: () {},
                ),
              ],
            ),
            _buildCategorySection(
              'MEDICAL RECORDS',
              [
                MenuTileData(
                  icon: Icons.history,
                  title: 'Medical History',
                  subtitle: 'View past treatments & diagnoses',
                  color: Colors.orange,
                  onTap: () {},
                ),
                MenuTileData(
                  icon: Icons.description_outlined,
                  title: 'Medical Reports',
                  subtitle: 'Lab reports & medical documents',
                  color: Colors.red,
                  onTap: () {},
                ),
                MenuTileData(
                  icon: Icons.medication_outlined,
                  title: 'Prescriptions',
                  subtitle: 'View & manage your medications',
                  color: Colors.teal,
                  onTap: () {},
                ),
              ],
            ),
            _buildCategorySection(
              'SETTINGS',
              [
                MenuTileData(
                  icon: Icons.payment,
                  title: 'Payment Methods',
                  subtitle: 'Manage your payment options',
                  color: Colors.indigo,
                  onTap: () {},
                ),
                MenuTileData(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  subtitle: 'Set your notification preferences',
                  color: Colors.amber,
                  onTap: () {},
                ),
                MenuTileData(
                  icon: Icons.dark_mode_outlined,
                  title: 'Theme',
                  subtitle: 'Switch between dark and light modes',
                  color: Colors.green,
                  onTap: () {
                    context.push(themeChangeScreenPath);
                  },
                ),
                MenuTileData(
                  icon: Icons.security,
                  title: 'Privacy & Security',
                  subtitle: 'Manage your account security',
                  color: Colors.deepPurple,
                  onTap: () {},
                ),
                MenuTileData(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  subtitle: 'Get help and contact support',
                  color: Colors.cyan,
                  onTap: () {},
                ),
                MenuTileData(
                  icon: Icons.logout,
                  title: 'Logout',
                  subtitle: 'Sign out of your account',
                  color: Colors.teal,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class MenuTileData {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  MenuTileData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });
}
