import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTextStyles {
  // Başlıklar için genel stil
  static const TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: 'ClashDisplay',
    fontWeight: FontWeight.w500,
    height: 0,
  );

  // Appbar title stil
  static const TextStyle appBarStyle = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.w500,
  );

  // Açıklama metinleri için stil
  static const TextStyle inputUnderText = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontFamily: 'ClashDisplay',
    fontWeight: FontWeight.w500,
    height: 0,
  );

  // Vurgulu metinler için stil
  static const TextStyle gridItemText = TextStyle(
    fontFamily: "ClashDisplay",
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.darkText,
  );

  // Vurgulu metinler için stil
  static const TextStyle cardText = TextStyle(
    fontFamily: "ClashDisplay",
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.darkText,
  );

  // Buton metinleri için stil
  static const TextStyle buttonStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'ClashDisplay',
    fontWeight: FontWeight.bold,
  );

// Eklemek istediğiniz diğer TextStyle'lar için...
}
