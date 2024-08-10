import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toleg/components/money.dart';
import 'package:toleg/screens/payments_screen.dart';
import '../components/grid_elements.dart';
import '../constants/colors.dart';
import '../enums/services_value.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                Money(),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final service = SevicesValue.values[index];
                  return ServiceCard(
                    icon: service.asIcons,
                    title: service.asValue,
                    onTap: () {
                      _navigateToService(context, service);
                    },
                  );
                },
                childCount: SevicesValue.values.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToService(BuildContext context, SevicesValue service) {
    switch (service) {
      case SevicesValue.tmcell:
      case SevicesValue.telecom:
      case SevicesValue.astu:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PaymentsScreen(),
          ),
        );
        break;
      default:
        print('Bu servis için yönlendirme tanımlanmadı.');
    }
  }
}
