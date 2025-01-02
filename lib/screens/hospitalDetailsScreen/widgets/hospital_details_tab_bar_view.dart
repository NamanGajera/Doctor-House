import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/screens/hospitalDetailsScreen/widgets/hospital_gallery_tab_view.dart';
import 'package:doctor_house/screens/hospitalDetailsScreen/widgets/specialist_tab_view.dart';
import 'package:doctor_house/screens/hospitalDetailsScreen/widgets/treatments_tab_view.dart';
import 'package:flutter/material.dart';

class HospitalTabView extends StatefulWidget {
  const HospitalTabView({super.key});

  @override
  State<HospitalTabView> createState() => _HospitalTabViewState();
}

class _HospitalTabViewState extends State<HospitalTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: context.isDarkTheme ? Colors.black : Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            indicatorWeight: 3,
            labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),
            labelPadding: EdgeInsets.zero,
            tabs: const [
              Tab(text: 'Treatments'),
              Tab(text: 'Specialist'),
              Tab(text: 'Gallery'),
              Tab(text: 'Review'),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              const TreatmentsTabView(),
              const SpecialistTabView(),
              const HospitalGalleryTabView(),
              _buildReviewTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue[50],
                      child: Text('U${index + 1}'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User ${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                  5,
                                  (starIndex) => Icon(
                                        Icons.star,
                                        size: 16,
                                        color: starIndex < 4 ? Colors.blue : Colors.grey,
                                      )),
                              const SizedBox(width: 8),
                              Text(
                                '${DateTime.now().subtract(Duration(days: index)).day} days ago',
                                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Great experience with the clinic. The staff was very professional and friendly. Would definitely recommend!',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
