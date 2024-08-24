import 'package:flutter/material.dart';

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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      // Kartın etrafına boşluk ekler
      child: ListTile(
        title: Text(
          cardHolderName, // Kart sahibinin adını gösterir
          style: const TextStyle(
              color: Colors.white, fontSize: 16), // Yazı rengi ve boyutu
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '•••• •••• •••• ${cardNumber.substring(cardNumber.length - 4)}',
              // Kart numarasının son dört hanesini gösterir
              style: const TextStyle(color: Colors.white), // Yazı rengi
            ),
            Text(
              bankName, // Banka adını gösterir
              style: const TextStyle(color: Colors.white), // Yazı rengi
            ),
          ],
        ),
        trailing: Text(
          expiryDate, // Kartın son kullanma tarihini gösterir
          style: const TextStyle(color: Colors.white), // Yazı rengi
        ),
        tileColor: Colors.grey[850],
        // Kartın arka plan rengi
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Kartın köşelerinin yuvarlanması
        ),
      ),
    );
  }
}
