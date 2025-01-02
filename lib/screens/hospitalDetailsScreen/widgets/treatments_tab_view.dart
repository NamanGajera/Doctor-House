import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';

class TreatmentsTabView extends StatefulWidget {
  const TreatmentsTabView({super.key});

  @override
  State<TreatmentsTabView> createState() => _TreatmentsTabViewState();
}

class _TreatmentsTabViewState extends State<TreatmentsTabView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Treatments (18)',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final treatments = [
                  'Dental Cleaning',
                  'Root Canal Treatment',
                  'Teeth Whitening',
                  'Dental Implants',
                  'Orthodontics',
                  'Facial Treatment',
                  'Acne Treatment',
                  'Skin Rejuvenation',
                  'Chemical Peeling',
                  'Laser Hair Removal',
                  'Eye Examination',
                  'Contact Lens Fitting',
                  'Glaucoma Treatment',
                  'Cataract Surgery',
                  'LASIK Surgery',
                ];
                return TreatmentItem(title: treatments[index % treatments.length]);
              },
              childCount: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class TreatmentItem extends StatelessWidget {
  final String title;

  const TreatmentItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.isDarkTheme ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.isDarkTheme ? Colors.white60 : Colors.grey.shade200),
      ),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
        onTap: () {},
      ),
    );
  }
}
