import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toleg/components/money.dart';
import 'package:toleg/components/other_grid_elements.dart';
import 'package:toleg/screens/payments_screen.dart';
import '../components/grid_elements.dart';
import '../constants/colors.dart';
import '../enums/other_services_value.dart';
import '../enums/services_value.dart';
import '../service_screen/contact_picker_screen.dart';
import '../service_screen/tmcell_screen.dart';

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
          const SliverToBoxAdapter(
            child: Column(
              children: [
                Money(),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Hyzmatlar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'ClashDisplay',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4 / 3,
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
          const SliverToBoxAdapter(
            // SliverToBoxAdapter kullanımı
              child: SizedBox(height: 30)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4 / 5,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final service = OtherServicesValue.values[index];
                  return OtherGridElements(
                    icon: service.asIcons,
                    title: service.asValue,
                    onTap: () {
                      _navigateToOtherService(context, service);
                    },
                  );
                },
                childCount: OtherServicesValue.values.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            // SliverToBoxAdapter kullanımı
              child: SizedBox(height: 16)),
        ],
      ),
    );
  }

  void _navigateToService(
      BuildContext context, SevicesValue service) {
    switch (service) {
      case SevicesValue.tmcell:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const TmcellScreen(), // TutScreen sayfasına yönlendirme
          ),
        );
        break;
      case SevicesValue.telecom:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            ContactPickerScreen(), // JayJemagatScreen sayfasına yönlendirme
          ),
        );
        break;
      case SevicesValue.astu:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const PaymentsScreen(), // SuwScreen sayfasına yönlendirme
          ),
        );
        break;
      default:
        print('Bu servis için yönlendirme tanımlanmadı.');
    }
  }

  void _navigateToOtherService(
      BuildContext context, OtherServicesValue service) {
    switch (service) {
      case OtherServicesValue.tut:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const PaymentsScreen(), // TutScreen sayfasına yönlendirme
          ),
        );
        break;
      case OtherServicesValue.jayJemagat:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const PaymentsScreen(), // JayJemagatScreen sayfasına yönlendirme
          ),
        );
        break;
      case OtherServicesValue.suw:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const PaymentsScreen(), // SuwScreen sayfasına yönlendirme
          ),
        );
        break;
      default:
        print('Bu servis için yönlendirme tanımlanmadı.');
    }
  }
}