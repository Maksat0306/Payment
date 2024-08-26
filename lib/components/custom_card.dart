import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/text_styles.dart';

class CustomCard extends StatelessWidget {
  final String cardHolderName; // Kart sahibinin adı
  final String cardNumber; // Kart numarası
  final String expiryDate; // Son kullanma tarihi
  final String bankName; // Banka adı

  CustomCard(
      {super.key,
      required this.cardHolderName,
      required this.cardNumber,
      required this.expiryDate,
      required this.bankName,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListTile(
        title: Text(
          cardHolderName, // Kart sahibinin adını gösterir
          style: AppTextStyles.cardText,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '•••• •••• •••• ${cardNumber.substring(cardNumber.length - 4)}',
              // Kart numarasının son dört hanesini gösterir
              style: AppTextStyles.cardText,
            ),
            Text(
              bankName, // Banka adını gösterir
              style: AppTextStyles.cardText,
            ),
          ],
        ),
        trailing: Text(
          expiryDate, // Kartın son kullanma tarihini gösterir
          style: AppTextStyles.cardText,
        ),
        tileColor: AppColors.darkCard, // Arka plan rengini ayarlıyoruz
        // Kartın arka plan rengi
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16), // Kartın köşelerinin yuvarlanması
        ),
      ),
    );
  }
}
