import 'package:flutter/material.dart';
import '../data/company_data.dart';
import '../widgets/feature_tile.dart';
import '../widgets/office_info_card.dart';
import '../widgets/section_header.dart';
import '../widgets/team_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/about.jpg', height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          const SectionHeader(eyebrow: 'About Us', title: CompanyData.aboutHeading),
          const SizedBox(height: 12),
          Text(CompanyData.aboutBody, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 28),
          for (final value in CompanyData.values) ...[
            FeatureTile(feature: value),
            const SizedBox(height: 18),
          ],
          const SizedBox(height: 12),
          SectionHeader(
            eyebrow: 'Our Features',
            title: 'Leading Ship Construction Company Since ${CompanyData.foundedYear}',
          ),
          const SizedBox(height: 18),
          for (final feature in CompanyData.features) ...[
            FeatureTile(feature: feature),
            const SizedBox(height: 18),
          ],
          const SizedBox(height: 12),
          const SectionHeader(eyebrow: 'Our Team', title: 'Expert Team Members'),
          const SizedBox(height: 16),
          SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: CompanyData.team.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (context, i) => TeamCard(member: CompanyData.team[i]),
            ),
          ),
          const SizedBox(height: 32),
          const OfficeInfoCard(),
        ],
      ),
    );
  }
}
