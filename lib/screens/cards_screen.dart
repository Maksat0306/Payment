import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/custom_card.dart';
import '../models.dart'; // Kart bilgileri için kullanılan modelin dosyasını import ediyoruz.
import 'add_card_screen.dart'; // Yeni kart eklemek için kullanılan ekranın dosyasını import ediyoruz.

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final List<CardInfo> _cards = []; // Kart bilgilerini tutan liste

  // Yeni bir kart eklemek için kullanılan işlev
  void _addNewCard(CardInfo cardInfo) {
    setState(() {
      _cards.add(cardInfo); // Yeni kartı listeye ekler ve ekranı günceller.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kartlarym"), // AppBar'da görüntülenen başlık
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20), // Sağdan boşluk ekler
            child: GestureDetector(
              onTap: () async {
                // "+" simgesine tıklanınca çalışacak işlev
                final newCard = await Navigator.push<CardInfo>(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AddCardScreen()), // Yeni kart ekleme ekranına yönlendirir
                );

                if (newCard != null) {
                  // Eğer yeni kart eklenmişse
                  _addNewCard(newCard); // Yeni kartı listeye ekler
                }
              },
              child: SvgPicture.asset(
                "assets/images/plus.svg", // "+" simgesi
                height: 26, // Simgesinin yüksekliği
                width: 26, // Simgesinin genişliği
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _cards.length, // Kart sayısı kadar liste öğesi oluşturur
        itemBuilder: (context, index) {
          final card = _cards[index]; // Listedeki mevcut kart
          return CustomCard(
            cardHolderName: card.cardHolderName,
            cardNumber: card.cardNumber,
            expiryDate: card.expiryDate,
            bankName: card.bankName,
          );
        },
      ),
    );
  }
}
