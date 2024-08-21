import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // backgroundColor: Color(0xFF2A2A2A), // Arka plan rengi
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // İç dolgu
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'ClashDisplay',
          color: Colors.blue, // Metin rengi
          fontSize: 16, // Yazı boyutu
          fontWeight: FontWeight.w600, // Yazı kalınlığı
        ),
      ),
    );
  }
}
