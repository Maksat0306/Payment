import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toleg/components/money.dart';
import 'package:toleg/screens/payments_screen.dart';
import 'package:toleg/screens/settings_screen.dart';
import 'package:toleg/utils/navigation.dart';
import '../components/bottom_navigation_bar.dart';
import '../components/grid_elements.dart';
import '../constants/colors.dart';
import 'cards_screen.dart';
import '../enums/services_value.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreenContent(), // Ana sayfa içeriği olarak ayrı bir widget
    const PaymentsScreen(),
    const CardsScreen(),
    const SettingsScreen(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedIndex], // Seçilen sayfayı gösteriyoruz
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgraund,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.darkCard,
        title: const Text(
          'Hyzmatlar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: "ClashDisplay",
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              "assets/images/bell.svg",
              height: 26,
              width: 26,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Money(),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
              itemCount: SevicesValue.values.length,
              itemBuilder: (context, index) {
                final service = SevicesValue.values[index];
                return ServiceCard(
                  icon: service.asIcons,
                  title: service.asValue,
                  onTap: () {
                    // Tıklama olayında ilgili sayfaya yönlendirme yapılır
                    switch (service) {
                      case SevicesValue.tmcell:
                        Navigator.push(
                          context,
                            navigateToScreen(context, const PaymentsScreen()) as Route<Object?>,
                        );
                        break;
                      case SevicesValue.telecom:
                        Navigator.push(
                          context,
                          navigateToScreen(context, const PaymentsScreen()) as Route<Object?>,
                        );
                        break;
                      case SevicesValue.astu:
                        Navigator.push(
                          context,
                          navigateToScreen(context, const PaymentsScreen()) as Route<Object?>,
                        );
                        break;
                    // Diğer servisler için de benzer yönlendirmeler ekleyin
                      default:
                        print('Bu servis için yönlendirme tanımlanmadı.');
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
