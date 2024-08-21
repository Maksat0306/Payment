import 'package:flutter/material.dart';

class CustomContinueButton extends StatelessWidget {
  final VoidCallback onPressed; // Butona basıldığında çalışacak işlev

  const CustomContinueButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Butonun genişliği ekranın tamamını kaplar
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4C8EFF), // Butonun arka plan rengi
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24), // Köşeleri hafif yuvarlak
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // İç dolgu
        ),
        child: const Text(
          'Dowam et', // Buton üzerindeki metin
          style: TextStyle(
            color: Colors.black, // Metin rengi
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'ClashDisplay',
          ),
        ),
      ),
    );
  }
}
