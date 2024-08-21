import 'package:flutter/material.dart';

class CustomPaymentButton extends StatelessWidget {
  final TextEditingController amountController;
  final VoidCallback onPressed;

  const CustomPaymentButton({
    Key? key,
    required this.amountController,
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
            borderRadius: BorderRadius.circular(24), // Köşeleri yuvarlak ama tam değil
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // İç dolgu
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Metni ortalamak için
          children: [
            const Text(
              'Jemi töleg: ', // Sabit metin kısmı
              style: TextStyle(
                color: Colors.black, // Metin rengi
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            AnimatedBuilder(
              animation: amountController,
              builder: (context, child) {
                return Text(
                  amountController.text.isEmpty ? '0 TMT' : '${amountController.text} TMT', // Dinlenen metin
                  style: const TextStyle(
                    fontFamily: 'ClashDisplay',
                    color: Colors.black, // Dinlenen metnin rengi
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
