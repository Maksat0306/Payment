import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import '../components/custom_card.dart';
import '../models.dart';
import '../providers.dart';
import 'add_card_screen.dart';

class CardsScreen extends ConsumerStatefulWidget {
  const CardsScreen({super.key});

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends ConsumerState<CardsScreen> {
  List<CardInfo> _cards = [];
  Box<CardInfo>? _box;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    _box = await Hive.openBox<CardInfo>('cards');
    _loadCards();
  }

  Future<void> _loadCards() async {
    if (_box != null) {
      setState(() {
        _cards = _box!.values.toList();
      });
    }
  }

  @override
  void dispose() {
    _box?.close();
    super.dispose();
  }

  void _addNewCard() async {
    final cardHolderName = ref.read(cardNameProvider);
    final cardNumber = ref.read(cardNumberProvider);
    final expiryDate = ref.read(expiryDateProvider);
    final selectedBank = ref.read(selectedBankProvider) ?? "Bilinmeyen Banka";

    final cardInfo = CardInfo(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      bankName: selectedBank,
    );

    _box?.add(cardInfo);
    setState(() {});
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
                  MaterialPageRoute(
                      builder: (context) => const AddCardScreen()),
                );
                if (newCard != null) {
                  _addNewCard();
                }
              },
              child: SvgPicture.asset("assets/images/plus.svg",
                  height: 26, width: 26),
            ),
          ),
        ],
      ),
      body: _cards.isEmpty
          ? Center(child: Text('Henüz kart eklenmedi.'))
          : ListView.builder(
              itemCount: _cards.length,
              itemBuilder: (context, index) {
                final card = _cards[index];
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
