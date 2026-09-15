import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets/app_scaffold.dart';

void main() {
  runApp(const PabedaApp());
}

class PabedaApp extends StatelessWidget {
  const PabedaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pabeda Ship Construction',
      debugShowCheckedModeBanner: false,
      theme: buildPabedaTheme(),
      home: const AppScaffold(),
    );
  }
}
