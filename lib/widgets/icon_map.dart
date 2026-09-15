import 'package:flutter/material.dart';

IconData iconFor(String key) {
  switch (key) {
    case 'design':
      return Icons.architecture;
    case 'plan':
      return Icons.map_outlined;
    case 'consult':
      return Icons.support_agent;
    case 'build':
      return Icons.precision_manufacturing;
    case 'acquire':
      return Icons.handshake_outlined;
    case 'repair':
      return Icons.build_circle_outlined;
    case 'innovative':
      return Icons.lightbulb_outline;
    case 'quality':
      return Icons.verified_outlined;
    case 'support':
      return Icons.headset_mic_outlined;
    case 'globe':
      return Icons.public;
    case 'clock':
      return Icons.schedule;
    default:
      return Icons.anchor;
  }
}
