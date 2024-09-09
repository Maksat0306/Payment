import 'package:hive/hive.dart';

part 'card_info.g.dart'; // Hive jeneratörü tarafından oluşturulacak dosya

@HiveType(typeId: 0) // typeId benzersiz olmalıdır
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
