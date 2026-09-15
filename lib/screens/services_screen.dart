import 'package:flutter/material.dart';
import '../data/company_data.dart';
import '../widgets/office_info_card.dart';
import '../widgets/section_header.dart';
import '../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(eyebrow: 'Our Services', title: 'Explore Our Ship Construction Services'),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: CompanyData.services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, i) => ServiceCard(service: CompanyData.services[i]),
          ),
          const SizedBox(height: 32),
          const OfficeInfoCard(),
        ],
      ),
    );
  }
}
