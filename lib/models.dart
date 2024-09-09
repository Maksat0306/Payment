import 'package:hive/hive.dart';

part "card_info.g.dart"; // Bu dosya Hive tarafından otomatik olarak oluşturulur

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

  CardInfo({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.bankName,
  });
}
