class CardInfo {
  final String cardHolderName; // Kart sahibinin adı
  final String cardNumber; // Kart numarası
  final String expiryDate; // Son kullanma tarihi
  final String bankName; // Banka adı

  CardInfo({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.bankName,
  });
}
