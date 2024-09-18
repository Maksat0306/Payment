import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../components/custom_card.dart';
import '../data/card_info_repo.dart';
import '../data/models.dart';
import 'add_card_screen.dart';

class CardsScreen extends ConsumerStatefulWidget {
  const CardsScreen({super.key});

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends ConsumerState<CardsScreen> {
  final cardInfoRepo = CardInfoRepo();

  @override
  Widget build(BuildContext context) {
    final cards = cardInfoRepo.getCardInfoList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kartlarym"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push<CardInfo>(
                  context,
                  MaterialPageRoute(builder: (context) => const AddCardScreen()),
                ).then((v) => setState(() {}));
              },
              child: SvgPicture.asset("assets/images/plus.svg", height: 26, width: 26),
            ),
          ),
        ],
      ),
      body: cards?.isEmpty ?? false
          ? const Center(child: Text('Henüz kart eklenmedi.'))
          : ListView.builder(
              itemCount: cards?.length,
              itemBuilder: (context, index) {
                final card = cards?[index];
                return CustomCard(
                  cardHolderName: card?.cardHolderName ?? '',
                  cardNumber: card?.cardNumber ?? '',
                  expiryDate: card?.expiryDate ?? '',
                  bankName: card?.bankName ?? '',
                );
              },
            ),
    );
  }
}
