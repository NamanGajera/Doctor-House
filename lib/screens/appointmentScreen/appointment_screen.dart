import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/screens/appointmentScreen/widgets/upcoming_appointment_tab.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
    _pageController.addListener(_onPageScroll);
  }

  void _onPageScroll() {
    setState(() => _currentPage = _pageController.page ?? 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: context.isDarkTheme ? Colors.black : Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTab(0, 'Upcoming', Icons.calendar_today_outlined),
                _buildTab(1, 'Completed', Icons.check_circle_outline),
                _buildTab(2, 'Cancelled', Icons.cancel_outlined),
              ],
            ),
          ),
          _buildIndicator(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _tabController.animateTo(index);
              },
              children: [
                UpcomingAppointmentTab(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String title, IconData icon) {
    final progress = 1.0 - (_currentPage - index).abs().clamp(0.0, 1.0);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: Color.lerp(Colors.grey, Colors.blue, progress),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Color.lerp(Colors.grey, Colors.blue, progress),
                  fontWeight: FontWeight.lerp(
                    FontWeight.normal,
                    FontWeight.w600,
                    progress,
                  ),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Container(
      height: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final tabWidth = maxWidth / 3;
          return Stack(
            children: [
              Container(
                color: Colors.grey.withOpacity(0.2),
              ),
              Positioned(
                left: _currentPage * tabWidth,
                child: Container(
                  height: 3,
                  width: tabWidth,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
