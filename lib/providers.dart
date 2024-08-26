import 'package:flutter_riverpod/flutter_riverpod.dart';

// Telefon numarası sağlayıcısı
final phoneProvider = StateProvider<String>((ref) => '');

// Tutar sağlayıcısı
final amountProvider = StateProvider<String>((ref) => '');

// Seçilen kart sağlayıcısı
final selectedCardProvider = StateProvider<String?>((ref) => null);

// Kart name provider
final cardNameProvider = StateProvider<String>((ref) => '');

// Kart number provider
final cardNumberProvider = StateProvider<String>((ref) => '');

// Kart expiryDate provider
final expiryDateProvider = StateProvider<String>((ref) => '');

// Seçilen bank sağlayıcısı
final selectedBankProvider = StateProvider<String?>((ref) => null);
