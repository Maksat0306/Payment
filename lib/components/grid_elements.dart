import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toleg/constants/colors.dart';

class ServiceCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.darkCard, // Arka plan rengini ayarlıyoruz
      borderRadius: BorderRadius.circular(16), // Köşe yuvarlama
      child: InkWell(
        borderRadius: BorderRadius.circular(16), // InkWell için köşe yuvarlama
        onTap: onTap, // Tıklama olayını tanımlıyoruz
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: icon,  // Burada ikon widget'ınız bulunuyor
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: "ClashDisplay",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
