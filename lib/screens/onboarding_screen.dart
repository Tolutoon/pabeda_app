import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/company_data.dart';
import '../theme.dart';
import '../widgets/icon_map.dart';

class OnboardingSlide {
  final String icon;
  final String title;
  final String body;

  const OnboardingSlide({required this.icon, required this.title, required this.body});
}

const _slides = <OnboardingSlide>[
  OnboardingSlide(
    icon: 'anchor',
    title: 'Welcome to Pabeda',
    body: CompanyData.tagline,
  ),
  OnboardingSlide(
    icon: 'quality',
    title: 'Shipbuilding Since ${CompanyData.foundedYear}',
    body: CompanyData.aboutBody,
  ),
  OnboardingSlide(
    icon: 'build',
    title: 'A Full-Service Shipyard',
    body: 'From designs and plan works to construction, acquisitions, and '
        'repairs — six services, delivered by one experienced team.',
  ),
  OnboardingSlide(
    icon: 'support',
    title: "We're Here to Help",
    body: 'Reach our Lagos and London offices any time. Browse what we '
        'offer, then get in touch in a couple of taps.',
  ),
];

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onFinished;

  const OnboardingScreen({super.key, required this.onFinished});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _complete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
    widget.onFinished();
  }

  void _next() {
    if (_index == _slides.length - 1) {
      _complete();
      return;
    }
    _controller.nextPage(duration: const Duration(milliseconds: 320), curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _index == _slides.length - 1;
    return Scaffold(
      backgroundColor: PabedaColors.dark,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: TextButton(
                  onPressed: isLast ? null : _complete,
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.white.withValues(alpha: isLast ? 0 : 0.7)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) => _SlideView(slide: _slides[i]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 28),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _slides.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: i == _index ? 22 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: i == _index ? PabedaColors.primary : Colors.white24,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _next,
                      child: Text(isLast ? 'Get Started' : 'Next'),
                    ),
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

class _SlideView extends StatelessWidget {
  final OnboardingSlide slide;

  const _SlideView({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PabedaColors.secondary.withValues(alpha: 0.14),
              border: Border.all(color: PabedaColors.secondary.withValues(alpha: 0.4)),
            ),
            child: Icon(iconFor(slide.icon), color: PabedaColors.secondary, size: 48),
          ),
          const SizedBox(height: 36),
          Text(
            slide.title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, height: 1.2),
          ),
          const SizedBox(height: 16),
          Text(
            slide.body,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 15, height: 1.5),
          ),
        ],
      ),
    );
  }
}
