import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../components/custom_card.dart';
import '../models.dart'; // Kart bilgileri için kullanılan modelin dosyasını import ediyoruz.
import '../providers.dart';
import 'add_card_screen.dart'; // Yeni kart eklemek için kullanılan ekranın dosyasını import ediyoruz.

class CardsScreen extends ConsumerStatefulWidget {
  const CardsScreen({super.key});

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends ConsumerState<CardsScreen> {
  final List<CardInfo> _cards = [];

  // Yeni bir kart eklemek için kullanılan işlev
  void _addNewCard(CardInfo cardInfo) {
    setState(() {
      _cards.add(cardInfo); // Yeni kartı listeye ekler ve ekranı günceller.
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardHolder = ref.watch(cardNameProvider);
    final cardNumber = ref.watch(cardNumberProvider);
    final expiryDate = ref.watch(expiryDateProvider);

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
            cardHolderName: cardHolder,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            bankName: card.bankName,
          );
        },
      ),
    );
  }
}
