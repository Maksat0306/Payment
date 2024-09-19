import 'package:flutter/material.dart';
import 'package:toleg/constants/colors.dart';

class OtherGridElements extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;

  const OtherGridElements({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.darkCard, // Arka plan rengini ayarlıyoruz
      borderRadius: BorderRadius.circular(16), // Köşe yuvarlama
      child: InkWell(
        borderRadius: BorderRadius.circular(16), // InkWell için köşe yuvarlama
        onTap: onTap, // Tıklama olayını tanımlıyoruz
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: icon,  // Burada ikon widget'ınız bulunuyor
              ),
              // const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center, // Yatayda ortalama
                  style: const TextStyle(
                    fontFamily: "ClashDisplay",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
