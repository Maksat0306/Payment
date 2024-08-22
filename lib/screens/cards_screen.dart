import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                  MaterialPageRoute(builder: (context) => const AddCardScreen()), // Yeni kart ekleme ekranına yönlendirir
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
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Kartın etrafına boşluk ekler
            child: ListTile(
              title: Text(
                card.cardHolderName, // Kart sahibinin adını gösterir
                style: const TextStyle(color: Colors.white, fontSize: 16), // Yazı rengi ve boyutu
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•••• •••• •••• ${card.cardNumber.substring(card.cardNumber.length - 4)}', // Kart numarasının son dört hanesini gösterir
                    style: const TextStyle(color: Colors.white), // Yazı rengi
                  ),
                  Text(
                    card.bankName, // Banka adını gösterir
                    style: const TextStyle(color: Colors.white), // Yazı rengi
                  ),
                ],
              ),
              trailing: Text(
                card.expiryDate, // Kartın son kullanma tarihini gösterir
                style: const TextStyle(color: Colors.white), // Yazı rengi
              ),
              tileColor: Colors.grey[850], // Kartın arka plan rengi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Kartın köşelerinin yuvarlanması
              ),
            ),
          );
        },
      ),
    );
  }
}
