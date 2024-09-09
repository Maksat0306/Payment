/*
import 'dart:convert';

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
  List<CardInfo> _cards = [];

  @override
  void initState() {
    super.initState();
    _loadCards(); // Uygulama başladığında kartları yükler
  }

  // Kartları SharedPreferences'dan yükleme
  Future<void> _loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedCards = prefs.getStringList('cards');

    if (savedCards != null) {
      setState(() {
        _cards = savedCards.map((card) => CardInfo.fromJson(json.decode(card))).toList();
      });
    }
  }

  // Kartları SharedPreferences'a kaydetme
  Future<void> _saveCards() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> cardList = _cards.map((card) => json.encode(card.toJson())).toList();
    await prefs.setStringList('cards', cardList);
  }

  // Yeni bir kart eklemek için kullanılan işlev
  void _addNewCard() {
    // Sağlayıcılardan verileri oku
    final cardHolderName = ref.read(cardNameProvider);
    final cardNumber = ref.read(cardNumberProvider);
    final expiryDate = ref.read(expiryDateProvider);
    final selectedBank = ref.read(selectedBankProvider) ?? "Bilinmeyen Banka";

    // Sağlayıcılardan alınan verileri kullanarak yeni kart oluştur
    final cardInfo = CardInfo(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      bankName: selectedBank,
    );

    setState(() {
      _cards.add(cardInfo);
    });
    _saveCards(); // Yeni kartı ekledikten sonra kartları kaydet
  }

  @override
  Widget build(BuildContext context) {
    // Sağlayıcıların güncel değerlerini oku
    final cardHolder = ref.watch(cardNameProvider);
    final cardNumber = ref.watch(cardNumberProvider);
    final expiryDate = ref.watch(expiryDateProvider);

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
                    builder: (context) => const AddCardScreen(),
                  ),
                );

                if (newCard != null) {
                  // Ekrana geri döndüğünde yeni kartı ekle
                  _addNewCard();
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
      body: _cards.isEmpty
          ? Center(child: Text('Henüz kart eklenmedi.')) // Boş liste durumunda gösterilecek mesaj
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

*/
