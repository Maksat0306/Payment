import 'package:flutter_riverpod/flutter_riverpod.dart';

// Telefon numarası sağlayıcısı
final phoneProvider = StateProvider<String>((ref) => '');

// Tutar sağlayıcısı
final amountProvider = StateProvider<String>((ref) => '');

// Seçilen kart sağlayıcısı
final selectedCardProvider = StateProvider<String?>((ref) => null);
