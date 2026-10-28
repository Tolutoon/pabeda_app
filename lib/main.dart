import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_screen.dart';
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
      home: const AppRoot(),
    );
  }
}

/// Decides whether to show onboarding or jump straight to the app, based on
/// whether onboarding has already been completed on this device.
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  bool? _onboardingComplete;

  @override
  void initState() {
    super.initState();
    _loadOnboardingStatus();
  }

  Future<void> _loadOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _onboardingComplete = prefs.getBool('onboarding_complete') ?? false);
  }

  @override
  Widget build(BuildContext context) {
    if (_onboardingComplete == null) {
      return const Scaffold(backgroundColor: PabedaColors.dark);
    }
    if (_onboardingComplete == false) {
      return OnboardingScreen(onFinished: () => setState(() => _onboardingComplete = true));
    }
    return const AppScaffold();
  }
}
