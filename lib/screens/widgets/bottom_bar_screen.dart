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
    super.initState();
  }

  Future<bool> _onWillPop()async{
    if(widget.navigationShell!.currentIndex != 0){
      widget.navigationShell!.goBranch(0);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: Container(
          height: 58,
          padding: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)
            ),
          ),
          child: Row(
            children: List.generate(labelText.length, (index){
              return Expanded(
                child: InkWell(
                  onTap: (){
                    _onItemTap(index);
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          iconPath[index],
                          height: 28,
                          width: 28,
                          color: widget.navigationShell?.currentIndex == index
                              ? primaryBlueColor
                              : Colors.grey,
                        ),
                        Text(
                          labelText[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: widget.navigationShell?.currentIndex == index
                                ? primaryBlueColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void _onItemTap(int index) {
    print('datsss==>>> ${widget.navigationShell}');
    if (widget.navigationShell != null) {
      widget.navigationShell?.goBranch(index, initialLocation: false);
    }
  }

}
