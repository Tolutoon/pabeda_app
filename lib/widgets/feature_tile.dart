import 'package:flutter/material.dart';
import '../data/company_data.dart';
import '../theme.dart';
import 'icon_map.dart';

class FeatureTile extends StatelessWidget {
  final FeatureInfo feature;

  const FeatureTile({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: PabedaColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(iconFor(feature.icon), color: PabedaColors.primary),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feature.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 17),
              ),
              const SizedBox(height: 4),
              Text(feature.description, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
