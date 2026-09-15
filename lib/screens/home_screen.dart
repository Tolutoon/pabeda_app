import 'package:flutter/material.dart';
import '../data/company_data.dart';
import '../theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/feature_tile.dart';
import '../widgets/office_info_card.dart';
import '../widgets/section_header.dart';
import '../widgets/service_card.dart';
import '../widgets/team_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _heroController = PageController();
  int _heroIndex = 0;

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHero(context),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAbout(context),
                const SizedBox(height: 32),
                _buildFeatures(context),
                const SizedBox(height: 32),
                _buildServicesPreview(context),
                const SizedBox(height: 32),
                _buildTeamPreview(context),
                const SizedBox(height: 32),
                const OfficeInfoCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _heroController,
            itemCount: CompanyData.heroImages.length,
            onPageChanged: (i) => setState(() => _heroIndex = i),
            itemBuilder: (context, i) => Image.asset(CompanyData.heroImages[i], fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  PabedaColors.dark.withValues(alpha: 0.35),
                  PabedaColors.dark.withValues(alpha: 0.85),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CompanyData.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  CompanyData.tagline,
                  style: const TextStyle(color: Colors.white, height: 1.4),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () => AppNav.of(context)?.goTo(2),
                  child: const Text('Explore Our Services'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 20,
            child: Row(
              children: List.generate(
                CompanyData.heroImages.length,
                (i) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == _heroIndex ? PabedaColors.primary : Colors.white54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(eyebrow: 'About Us', title: CompanyData.aboutHeading),
        const SizedBox(height: 12),
        Text(CompanyData.aboutBody, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () => AppNav.of(context)?.goTo(1),
          child: const Text('Discover More'),
        ),
      ],
    );
  }

  Widget _buildFeatures(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          eyebrow: 'Our Features',
          title: 'Leading Ship Construction Company Since ${CompanyData.foundedYear}',
        ),
        const SizedBox(height: 18),
        for (final feature in CompanyData.features) ...[
          FeatureTile(feature: feature),
          const SizedBox(height: 18),
        ],
      ],
    );
  }

  Widget _buildServicesPreview(BuildContext context) {
    final preview = CompanyData.services.take(4).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(eyebrow: 'Our Services', title: 'Explore Our Ship Construction Services'),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: preview.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, i) => ServiceCard(service: preview[i]),
        ),
        const SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed: () => AppNav.of(context)?.goTo(2),
            child: const Text('View All Services'),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamPreview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
