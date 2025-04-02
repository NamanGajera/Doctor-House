import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/features/homeScreen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/images.dart';

class HospitalHeader extends StatelessWidget {
  const HospitalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(hospitalSampleImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 0,
          right: 0,
          child: Container(
            height: 260,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: context.isDarkTheme ? Colors.black : Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 15),
                HospitalInfo(),
                SizedBox(height: 20),
                ActionButtons(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Positioned(
          top: 135,
          left: 0,
          right: 0,
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '${state.hospitalData?.rating ?? ''} (1k+ Review)',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 20,
                  ),
                ).onTap(() {
                  context.pop();
                }),
                BlocBuilder<HomeScreenBloc, HomeScreenState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<HomeScreenBloc>().add(ToggleHospitalLikeEvent(
                              hospitalId: state.hospitalData?.id ?? '',
                              isLike: !(state.hospitalData?.isLiked ?? false),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          (state.hospitalData?.isLiked ?? false) ? Icons.favorite : Icons.favorite_outline,
                          color: (state.hospitalData?.isLiked ?? false) ? Colors.red : Colors.black,
                          size: 20,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HospitalInfo extends StatelessWidget {
  const HospitalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.hospitalData?.name ?? '-',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                state.hospitalData?.hospitalType ?? '-',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 13),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blue, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      state.hospitalData?.address ?? '-',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.blue, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    '15 min · 1.5km · Mon Sun | 11 am - 11pm',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(
            context,
            icon: Icons.language,
            label: 'Website',
            onTap: () {},
          ),
          _buildActionButton(
            context,
            icon: Icons.message_outlined,
            label: 'Message',
            onTap: () {},
          ),
          _buildActionButton(
            context,
            icon: Icons.phone_outlined,
            label: 'Call',
            onTap: () {},
          ),
          _buildActionButton(
            context,
            icon: Icons.directions_outlined,
            label: 'Direction',
            onTap: () {},
          ),
          _buildActionButton(
            context,
            icon: Icons.share,
            label: 'Share',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label, required Function() onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
