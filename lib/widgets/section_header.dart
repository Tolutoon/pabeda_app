import 'package:flutter/material.dart';
import '../theme.dart';

class SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final TextAlign align;

  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxis = align == TextAlign.center
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    return Column(
      crossAxisAlignment: crossAxis,
      children: [
        Text(
          eyebrow.toUpperCase(),
          textAlign: align,
          style: const TextStyle(
            color: PabedaColors.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: align,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
