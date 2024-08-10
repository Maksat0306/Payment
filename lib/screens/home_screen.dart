import 'package:flutter/material.dart';
import 'package:toleg/screens/payments_screen.dart';
import 'package:toleg/screens/settings_screen.dart';
import '../components/bottom_navigation_bar.dart';
import 'cards_screen.dart';
import 'home_screen_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreenContent(),
    PaymentsScreen(),
    CardsScreen(),
    SettingsScreen(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
      ),
    );
  }
}
