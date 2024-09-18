import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'models.g.dart'; // Bu satırı ekleyin

@HiveType(typeId: 0)
class CardInfo extends HiveObject {
  @HiveField(0)
  final String cardHolderName;

  @HiveField(1)
  final String cardNumber;

  @HiveField(2)
  final String expiryDate;

  @HiveField(3)
  final String bankName;

  @HiveField(4)
  final String id;

  CardInfo({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.bankName,
  }) : id = const Uuid().v4();

  copyWith({
    String? cardHolderName,
    String? cardNumber,
    String? expiryDate,
    String? bankName,
  }) {
    return CardInfo(
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      bankName: bankName ?? this.bankName,
    );
  }
}
