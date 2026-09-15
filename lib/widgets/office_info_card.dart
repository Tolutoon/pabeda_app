import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/company_data.dart';
import '../theme.dart';

Future<void> _launch(Uri uri) async {
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

class OfficeInfoCard extends StatelessWidget {
  const OfficeInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: PabedaColors.dark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Locations',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          for (final office in CompanyData.offices) ...[
            _InfoRow(icon: Icons.location_on_outlined, title: office.label, subtitle: office.address),
            const SizedBox(height: 12),
          ],
          for (final phone in CompanyData.phoneNumbers)
            _InfoRow(
              icon: Icons.phone_outlined,
              title: phone,
              onTap: () => _launch(Uri(scheme: 'tel', path: phone.replaceAll(' ', ''))),
            ),
          const SizedBox(height: 4),
          _InfoRow(
            icon: Icons.email_outlined,
            title: CompanyData.email,
            onTap: () => _launch(Uri(scheme: 'mailto', path: CompanyData.email)),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const _InfoRow({required this.icon, required this.title, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: PabedaColors.secondary, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: onTap != null ? TextDecoration.underline : null,
                      decorationColor: Colors.white54,
                    ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(subtitle!, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
