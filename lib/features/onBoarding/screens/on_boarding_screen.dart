import 'package:doctor_house/core/constants/images.dart';
import 'package:doctor_house/core/constants/size.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/features/onBoarding/widgets/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/colors.dart';
import '../bloc/on_boardin_screen_bloc.dart';
import '../bloc/on_boardin_screen_event.dart';
import '../bloc/on_boardin_screen_state.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pages = [
    /// Page 1
    OnBoardingPage(
      backgroundColor: lightCream,
      height: screenHeight * 0.2,
      width: screenWidth,
      textColor: Colors.black,
      image: onBoardingScreenImage1,
      headline: 'Book Doctor Appointment',
      subHedline: 'Prevention is better than cure schedule an appointment now',
      pageText: '1/3',
      islastpage: false,
    ),

    /// Page 2
    OnBoardingPage(
      backgroundColor: lightGreen1,
      height: screenHeight * 0.2,
      width: screenWidth,
      textColor: Colors.black,
      image: onBoardingScreenImage2,
      headline: 'Book Doctor Consultation',
      subHedline: 'Our healthcare professionals are here to make you feel better',
      pageText: '2/3',
      islastpage: false,
    ),

    /// Page 3
    OnBoardingPage(
      backgroundColor: lightRed,
      height: screenHeight * 0.2,
      width: screenWidth,
      image: onBoardingScreenImage3,
      textColor: Colors.black,
      headline: 'Doctor House',
      subHedline: 'Discover who we are and what we can do for your health',
      pageText: '3/3',
      islastpage: true,
    ),
  ];
  final liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingSkippedState) {
            liquidController.jumpToPage(page: 2);
          }
        },
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            int currentPage = 0;

            if (state is OnboardingPageChangedState) {
              currentPage = state.pageIndex;
            }

            return Stack(
              children: [
                LiquidSwipe(
                  liquidController: liquidController,
                  pages: pages,
                  slideIconWidget: currentPage != 2 ? const Icon(Icons.arrow_back_ios) : const SizedBox(),
                  enableSideReveal: true,
                  enableLoop: false,
                  positionSlideIcon: 0.85,
                  onPageChangeCallback: (index) {
                    context.read<OnboardingBloc>().add(OnboardingPageChangedEvent(index));
                  },
                ),
                if (currentPage != 2)
                  Positioned(
                    top: 50,
                    right: 40,
                    child: GestureDetector(
                      onTap: () => context.read<OnboardingBloc>().add(SkipOnboardingEvent()),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: context.screenHeight * 0.008,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter, // This ensures the indicator is centered horizontally
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentPage,
                      count: 3,
                      effect: const WormEffect(
                        activeDotColor: primaryDarkBlueColor,
                        dotHeight: 6.0,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
