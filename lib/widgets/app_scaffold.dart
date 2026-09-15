import 'package:flutter/material.dart';
import '../theme.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/services_screen.dart';
import '../screens/contact_screen.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _index = 0;

  static const _titles = ['Home', 'About', 'Services', 'Contact'];
  static const _navIcons = [Icons.home_outlined, Icons.info_outline, Icons.build_outlined, Icons.mail_outline];

  final _screens = const [
    HomeScreen(),
    AboutScreen(),
    ServicesScreen(),
    ContactScreen(),
  ];

  void goTo(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/pabeda.png', height: 32),
            const SizedBox(width: 10),
            const Text(
              'Pabeda',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              for (var i = 0; i < _titles.length; i++)
                ListTile(
                  leading: Icon(_navIcons[i], color: _index == i ? PabedaColors.secondary : null),
                  title: Text(
                    _titles[i],
                    style: TextStyle(
                      color: _index == i ? PabedaColors.secondary : null,
                      fontWeight: _index == i ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  selected: _index == i,
                  onTap: () {
                    goTo(i);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
      body: AppNav(
        goTo: goTo,
        child: IndexedStack(index: _index, children: _screens),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: goTo,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), activeIcon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.build_outlined), activeIcon: Icon(Icons.build), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), activeIcon: Icon(Icons.mail), label: 'Contact'),
        ],
      ),
    );
  }
}

/// Lets any descendant screen switch bottom-nav tabs (e.g. a "Discover More" button).
class AppNav extends InheritedWidget {
  final void Function(int index) goTo;

  const AppNav({super.key, required this.goTo, required super.child});

  static AppNav? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppNav>();

  @override
  bool updateShouldNotify(AppNav oldWidget) => goTo != oldWidget.goTo;
}
