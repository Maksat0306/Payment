import 'package:flutter/material.dart';

class AppTextStyles {
  // Başlıklar için genel stil
  static const TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: 'ClashDisplay',
    fontWeight: FontWeight.w500,
    height: 0,
  );

  // Alt başlıklar için stil
  static const TextStyle subtitleStyle = TextStyle(
    color: Colors.white70,
    fontSize: 16,
    fontFamily: 'ClashDisplay',
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  // Açıklama metinleri için stil
  static const TextStyle bodyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14,
    fontFamily: 'ClashDisplay',
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  // Vurgulu metinler için stil
  static const TextStyle highlightedStyle = TextStyle(
    color: Colors.blue,
    fontSize: 18,
    fontFamily: 'ClashDisplay',
    fontWeight: FontWeight.w600,
    height: 1.2,
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
