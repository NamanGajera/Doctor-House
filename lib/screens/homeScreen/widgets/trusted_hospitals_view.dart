import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/images.dart';

class TrustedHospitalsView extends StatefulWidget {
  const TrustedHospitalsView({super.key});

  @override
  State<TrustedHospitalsView> createState() => _TrustedHospitalsViewState();
}

class _TrustedHospitalsViewState extends State<TrustedHospitalsView> {
  /// Store favorite status for each hospital
  final List<bool> _favorites = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    /// Main container with horizontal scroll
    return SizedBox(
      height: 320,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 16, left: 4, bottom: 12),
        itemBuilder: (context, index) {
          /// Individual hospital card
          return Container(
            width: 200,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: context.isDarkTheme ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: context.isDarkTheme ? Colors.white38 : Colors.transparent,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image section with rating and favorite button
                Expanded(
                  flex: 7,
                  child: Stack(
                    children: [
                      /// Hospital image container
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                          image: const DecorationImage(
                            image: AssetImage(hospitalSampleImage),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),

                      /// Favorite button
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _favorites[index] = !_favorites[index];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Icon(
                              _favorites[index] ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                              color: _favorites[index] ? Colors.red : Colors.grey.shade600,
                              size: 18,
                            ),
                          ),
                        ),
                      ),

                      /// Rating badge
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Hospital information section
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sterling Hospital',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.local_hospital_rounded,
                              color: Colors.blue.shade400,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                'MultiSpecialist Hospital',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: Colors.blue.shade400,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                'City Hospital, Near Science City, Ahmedabad',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_rounded,
                              color: Colors.blue.shade400,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '+91 98765 43210',
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
