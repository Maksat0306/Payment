import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models.dart';
import 'add_card_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final List<CardInfo> _cards = []; // Kart bilgilerini tutan liste

  void _addNewCard(CardInfo cardInfo) {
    setState(() {
      _cards.add(cardInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kartlarym"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () async {
                final newCard = await Navigator.push<CardInfo>(
                  context,
                  MaterialPageRoute(builder: (context) => const AddCardScreen()),
                );

                if (newCard != null) {
                  _addNewCard(newCard);
                }
              },
              child: SvgPicture.asset(
                "assets/images/plus.svg",
                height: 26,
                width: 26,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          final card = _cards[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                card.cardHolderName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•••• •••• •••• ${card.cardNumber.substring(card.cardNumber.length - 4)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    card.bankName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              trailing: Text(
                card.expiryDate,
                style: const TextStyle(color: Colors.white),
              ),
              tileColor: Colors.grey[850],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
