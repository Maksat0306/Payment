import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart'; // Eğer renkler burada tanımlıysa

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        elevation: 0,
        selectedItemColor: Colors.white, // Seçili öğe rengi
        unselectedItemColor: Colors.grey, // Seçili olmayan öğe rengi
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'ClashDisplay',
          fontWeight: FontWeight.w500,
          height: 0,
        ), // Seçili öğe metin rengi
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontFamily: 'ClashDisplay',
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: AppColors.darkCard,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset("assets/images/heroicons-solid/home.svg"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset("assets/images/heroicons-outline/home.svg"),
            ),
            label: "Esasy",
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset("assets/images/heroicons-solid/inbox.svg"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset("assets/images/heroicons-outline/inbox.svg"),
            ),
            label: "Tölegler",
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset("assets/images/heroicons-solid/credit-card.svg"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset("assets/images/heroicons-outline/credit-card.svg"),
            ),
            label: "Kartlar",
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset("assets/images/heroicons-solid/cog-8-tooth.svg"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset("assets/images/heroicons-outline/cog-8-tooth.svg"),
            ),
            label: "Sazlamak",
          ),
        ],
      ),
    );
  }
}
