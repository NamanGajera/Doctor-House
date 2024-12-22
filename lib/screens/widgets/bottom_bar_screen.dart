import 'package:doctor_house/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BottomBarScreen extends StatefulWidget {
  final StatefulNavigationShell? navigationShell;
  const BottomBarScreen({super.key, this.navigationShell});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  late PageController _pageController;
  final int _selectedIndex = 0;

  List<String> labelText = [
    'Home',
    'Appointment',
    'Social',
    'Pharmacy',
    'Menu'
  ];

  List<String> iconPath = [
    'assets/svg/home_icon.svg',
    'assets/svg/appointment_icon.svg',
    'assets/svg/social_icon.svg',
    'assets/svg/pharmacy_icon.svg',
    'assets/svg/menu_icon.svg'
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics:const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [

        ],
      ),
      bottomNavigationBar: Container(
        height: 58,
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
          ),
        ),
        child: Row(
          children: List.generate(labelText.length, (index){
            return Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      iconPath[index],
                      height: 28,
                      width: 28,
                      color: _selectedIndex == index
                          ? primaryBlueColor
                          : Colors.grey,
                    ),
                    Text(
                      labelText[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        color: _selectedIndex == index
                            ? primaryBlueColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
  


}
